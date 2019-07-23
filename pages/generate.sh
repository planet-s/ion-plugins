#!/bin/sh

super=$(dirname "$(dirname "$(readlink -f "$0")")")
collected='[]'

for file in $super/*/*.ion; do
  jq_prog='split("\n") | map(split("\t")) | map({ key: .[0], value: .[1]}) | map(select(.key != null)) | from_entries'
  title=$(basename -- "$file" '.ion')
  category=$(basename $(dirname $file))
  desc=$(awk -v i=1 '$1 == "#"{ if (NR == i) { i += 1; for (j=2; j<=NF; j++) printf $j " "; print "" } else { exit } }' "$file" | pandoc -f markdown)
  aliases=$(perl -ne '/^ *alias (\w[\w_]*) = '"'"'(.+)'"'"'/ && print "$1\t$2\n";' "$file" | jq -Rs "$jq_prog")
  funcs=$(perl -ne '/^ *fn (.*?) -- (.*)$/ && print "$1\t$2\n"' "$file" | jq -Rs "$jq_prog")

  out=$(printf "%s" "$collected" | jq -e \
     --arg title       "$title" \
     --arg category    "$category" \
     --arg desc        "$desc" \
     --argjson aliases "$aliases" \
     --argjson funcs   "$funcs" \
     '. += [{ desc: $desc, title: $title, category: $category, aliases: $aliases, funcs: $funcs }]')
  if [ $? -eq 0 ] && [ -n "$out" ]; then
    collected=$out
  else
    printf "\033[31;1m --> Error for file $file \033[0m\n"

    exit 1
  fi
done

printf "%s\n" "$collected" | jq '.'
