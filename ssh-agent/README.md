# ssh-agent plugin

This plugin starts automatically `ssh-agent` to set up and load whichever
credentials you want for ssh connections.

To enable it, add `ssh-agent` to your plugins:

```
load [... ssh-agent]
```

## Instructions

**IMPORTANT: put these settings _before_ the line that sources this file**

To enable **agent forwarding support** add the following to your initrc file:

```
let ssh-agent-forwarding = 1
```

To **load identities** use the `ssh-agent-identities` variable, For example:

```
let ssh-agent-identities = [ id_rsa id_rsa2 id_github ]
```

To **set the maximum lifetime of the identities**, use the `ssh-agent-lifetime` variable.
The lifetime may be specified in seconds or as described in sshd_config(5)
(see _TIME FORMATS_). If left unspecified, the default lifetime is forever.

```
let ssh-agent-lifetime 4h
```

## Security

To avoid exposing those configs, those variables will be dropped in the config

## Credits

Based on code from Joseph M. Reagle: https://www.cygwin.com/ml/cygwin/2001-06/msg00537.html
Agent-forwarding support based on ideas from Florent Thoumie and Jonas Pfenniger

