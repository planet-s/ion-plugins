# Mercurial plugin
## Aliases
### general
* `hgc` - `hg commit`
* `hgb` - `hg branch`
* `hgba` - `hg branches`
* `hgbk` - `hg bookmarks`
* `hgco` - `hg checkout`
* `hgd`  - `hg diff`
* `hged` - `hg diffmerge`

### pull and update
* `hgi` - `hg incoming`
* `hgl` - `hg pull -u`
* `hglr` - `hg pull --rebase`
* `hgo` - `hg outgoing`
* `hgp` - `hg push`
* `hgs` - `hg status`
* `hgsl` - `hg log --limit 20 --template "{node|short} | {date|isodatesec} | {author|user}: {desc|strip|firstline}\n"`

### this is the 'git commit --amend' equivalent
* `hgca` - `hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip`

### list unresolved files (since hg does not list unmerged files in the status command)
* `hgun` - `hg resolve --list`

## Displays repo branch and directory status in prompt
This is the same as git plugin does.

## Based upon the work of [ptrv](https://github.com/ptrv) and [oshybystyi](https://github.com/oshybystyi)
