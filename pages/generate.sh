#!/bin/sh

super=$(dirname "$(dirname "$(readlink -f "$0")")")
collected='[]'

for file in $super/*/*.ion; do
  title=$(basename -- "$file" '.ion')
  category=$(basename $(dirname $file))
  desc=$(grep -oPn '(?=^# ).*' "$file" | awk 'BEGIN{FS=OFS=":"}{if ($1 == i + 1) { $1=""; i++; print $0} else {}}' | sed 's/:# //g' | pandoc -f markdown)
  aliases=$(grep -oP '(?=^ *)alias (\w[\w_]*) = '"'"'(.+)'"'" "$file" | sed 's/alias \(\w[\w_]*\) = '"'"'\(.*\)'"'"'/\1\t\2/g' | jq -Rs 'split("\n") | map(split("\t")) | map({ key: .[0], value: .[1]}) | map(select(.key != null)) | from_entries')
  funcs=$(grep -oP '(?=^ *)fn (.*) -- (.*)' "$file" | sed 's/fn \(.*\) -- \(.*\)/\1\t\2/g' | jq -Rs 'split("\n") | map(split("\t")) | map({ key: .[0], value: .[1]}) | map(select(.key != null)) | from_entries')

  out=$(echo $collected | jq -e \
     --arg desc        "$desc" \
     --arg title       "$title" \
     --arg category    "$category" \
     --argjson aliases "$aliases" \
     --argjson funcs   "$funcs" \
     '. += [{ desc: $desc, title: $title, category: $category, aliases: $aliases, funcs: $funcs }]' | jq .)
  if [ $? -eq 0 ] && [ -n "$out" ]; then
    collected=$out
  else
    printf "\033[31;1m Error for file $file \033[0m"

    exit 1
  fi
done

echo $collected | jq '.'
