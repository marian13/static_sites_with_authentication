# Static Sites with Authentication

## Quick Links

| |  |
| - | - |
| Local App | [http://localhost:3000](http://localhost:3000) |
| Production App | [https://static-sites-with-authentication.fly.dev](https://static-sites-with-authentication.fly.dev) |
| Fly Stats | [https://fly.io/apps/static-sites-with-authentication](https://fly.io/apps/static-sites-with-authentication) |

## Installation

```bash
mkdir -p ~/Projects && git clone git@github.com:marian13/static_sites_with_authentication.git
```

## Requirements

- [Task](https://taskfile.dev).

- Ruby version manager ([asdf](https://asdf-vm.com) is preferred).

- Node.js version manager ([asdf](https://asdf-vm.com) is preferred).

- [Ruby 3.1.0](https://www.ruby-lang.org/en/news/2021/12/25/ruby-3-1-0-released).

- [Node.js v18.12.1](https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V18.md#18.12.1).

## Setup

```bash
cd ~/Projects/static_sites_with_authentication && task install
```

## Development

### How to start a local backend server?

- Run the following command:

  ```bash
  cd ~/Projects/static_sites_with_authentication && task backend:start
  ```

- Open [http://localhost:3000](http://localhost:3000) in your browser.

**NOTE:** Static sites are NOT hot-reloaded.

### How to start a local static sites server with hot reloading?

- For example, for the `code_notes` static site, the command looks like so:

  ```bash
  cd ~/Projects/static_sites_with_authentication && task static_sites:code_notes:start
  ```

- Open [http://localhost:8000](http://localhost:8000) in your browser.

**NOTE:** Hot-reloaded `code_notes` server has no backend access.

### How to add a new static site?

- Check how the `static_sites:code_notes:build` command is implemented and used in the [Taskfile](https://github.com/marian13/static_sites_with_authentication/blob/main/Taskfile.yml).

- Adjust the regular expression in the [config/routes.rb](https://github.com/marian13/static_sites_with_authentication/blob/main/config/routes.rb).

- Add new static site by analogy.

## Seeds

### How to create a user locally?

- Open Rails console:

  ```bash
  cd ~/Projects/static_sites_with_authentication && bundle exec rails console
  ```

- Execute the command below:

  ```ruby
  User.create!(email: "user@example.com", password: "secret")
  ```

- Don't forget to replace email and password.

## Tech Stack

### Application

- [Rails](https://rubyonrails.org).

- [Devise](https://github.com/heartcombo/devise).

- [Gatsby](https://www.gatsbyjs.com/docs/quick-start).

- [A starter for the "Code Notes" Gatsby theme](https://github.com/mrmartineau/gatsby-starter-code-notes).

- [Docusaurus](https://docusaurus.io).

- [Materialize](https://materializecss.com).

### Databases

- [SQLite](https://www.sqlite.org/index.html).

### Tests

- [RSpec](https://rspec.info).

### Task runner

- [Task](https://taskfile.dev).

### Hosting

- [Fly.io](https://fly.io).
