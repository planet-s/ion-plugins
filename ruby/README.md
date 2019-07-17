# Ruby plugin

This plugin adds aliases for common commands used in dealing with [Ruby](https://www.ruby-lang.org/en/), [gem packages](https://rubygems.org/), [Ruby On Rails Framework](https://rubyonrails.org/) and [Rake](https://ruby.github.io/rake/) commands, as well as for logs.

## Aliases

### General aliases
| Alias | Command                                | Description                                          |
|-------|----------------------------------------|------------------------------------------------------|
| rb    | `ruby`                                 | The Ruby command                                     |
| sgem  | `sudo gem`                             | Run sudo gem on the system ruby, not the active ruby |
| rfind | `find . -name "*.rb" \| xargs grep -n` | Find ruby file                                       |
| gin   | `gem install`                          | Install a gem into the local repository              |
| gun   | `gem uninstall`                        | Uninstall gems from the local repository             |
| gli   | `gem list`                             | Display gems installed locally                       |

### Rails aliases

| Alias | Command                    | Description                                        |
|-------|----------------------------|----------------------------------------------------|
| `rc`  | `rails console`            | Interact with your Rails app from the CLI          |
| `rcs` | `rails console --sandbox`  | Test code in a sandbox, without changing any data  |
| `rd`  | `rails destroy`            | Undo a generate operation                          |
| `rdb` | `rails dbconsole`          | Interact with your db from the console             |
| `rgen`  | `rails generate`           | Generate boilerplate code                          |
| `rgm` | `rails generate migration` | Generate a db migration                            |
| `rp`  | `rails plugin`             | Run a Rails plugin command                         |
| `ru`  | `rails runner`             | Run Ruby code in the context of Rails              |
| `rs`  | `rails server`             | Launch a web server                                |
| `rsd` | `rails server --debugger`  | Launch a web server with debugger                  |
| `rsp` | `rails server --port`      | Launch a web server and specify the listening port |

### Rake aliases

| Alias   | Command                         | Description                                            |
|---------|---------------------------------|--------------------------------------------------------|
| `rdm`   | `rake db:migrate`               | Run pending db migrations                              |
| `rdms`  | `rake db:migrate:status`        | Show current db migration status                       |
| `rdmtc` | `rake db:migrate db:test:clone` | Run pending migrations and clone db into test database |
| `rdr`   | `rake db:rollback`              | Roll back the last migration                           |
| `rdc`   | `rake db:create`                | Create the database                                    |
| `rds`   | `rake db:seed`                  | Seed the database                                      |
| `rdd`   | `rake db:drop`                  | Delete the database                                    |
| `rdrs`  | `rake db:reset`                 | Delete the database and set it up again                |
| `rdtc`  | `rake db:test:clone`            | Clone the database into the test database              |
| `rdtp`  | `rake db:test:prepare`          | Duplicate the db schema into your test database        |
| `rdsl`  | `rake db:schema:load`           | Load the database schema                               |
| `rlc`   | `rake log:clear`                | Clear Rails logs                                       |
| `rn`    | `rake notes`                    | Search for notes (`FIXME`, `TODO`) in code comments    |
| `rr`    | `rake routes`                   | List all defined routes                                |
| `rrg`   | `rake routes | grep`            | List and filter the defined routes                     |
| `rt`    | `rake test`                     | Run Rails tests                                        |
| `rmd`   | `rake middleware`               | Interact with Rails middlewares                        |
| `rsts`  | `rake stats`                    | Print code statistics                                  |

### Utility aliases

| Alias     | Command                       | Description                                    |
|-----------|-------------------------------|------------------------------------------------|
| `devlog`  | `tail -f log/development.log` | Show and follow changes to the development log |
| `prodlog` | `tail -f log/production.log`  | Show and follow changes to the production log  |
| `testlog` | `tail -f log/test.log`        | Show and follow changes to the test log        |

### Legacy stuff

| Alias   | Command                            |
|---------|------------------------------------|
| `sstat` | `thin --stats "/thin/stats" start` |
| `sg`    | `ruby script/generate`             |
| `sd`    | `ruby script/destroy`              |
| `sp`    | `ruby script/plugin`               |
| `sr`    | `ruby script/runner`               |
| `ssp`   | `ruby script/spec`                 |
| `sc`    | `ruby script/console`              |
| `sd`    | `ruby script/server --debugger`    |

