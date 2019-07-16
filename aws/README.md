# aws

This plugin provides a few utilities to manage AWS profiles and display them in the prompt.

To use it, add `aws` to the plugins array in your initrc file.

```zsh
load [... aws]
```

## Plugin commands

* `asp [<profile>]`: sets `$AWS_PROFILE` to `<profile>`.
  It also sets `$AWS_EB_PROFILE` to `<profile>` for the Elastic Beanstalk CLI.
  Run `asp` without arguments to clear the profile.

* `agp`: gets the current value of `$AWS_PROFILE`.

* `aws_change_access_key`: changes the AWS access key of a profile.

* `aws_profiles`: lists the available profiles in the  `$AWS_CONFIG_FILE` (default: `~/.aws/config`).
  Used to provide completion for the `asp` function.

## Theme
The plugin creates an `aws_prompt_info` function that you can use in your theme, which displays
the current `$AWS_PROFILE`.
