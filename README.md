# Code Review

## Installation

```bash
mkdir -p ~/Projects && git clone git@github.com:marian13/code_review.git
```

## Requirements

- [Task](https://taskfile.dev/).

- Ruby version manager ([asdf](https://asdf-vm.com/) is preferred).

- Node.js version manager ([asdf](https://asdf-vm.com/) is preferred).

- [Ruby 3.1.0](https://www.ruby-lang.org/en/news/2021/12/25/ruby-3-1-0-released/).

- [Node.js v18.12.1](https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V18.md#18.12.1).

## Setup

```bash
cd ~/Projects/code_review && task deps:install
```

## Development

### How to start a local server for the whole app?

- Run the following command:

  ```bash
  cd ~/Projects/code_review && task app:start
  ```

- Open [http://localhost:3000](http://localhost:3000/) in your browser.

**NOTE:** `rules` is NOT hot-reloaded.

### How to start a local `rules` server with hot reloading?

- Run the following command:

  ```bash
  cd ~/Projects/code_review && task app:rules:start
  ```

- Open [http://localhost:8000](http://localhost:8000/) in your browser.

## Seeds

### How to create a user?

- Open Rails console:

  ```bash
  cd ~/Projects/code_review && bundle exec rails console
  ```

- Execute the command below:

  ```ruby
  User.create!(email: "user@example.com", password: "secret")
  ```

- Don't forget to replace email and password.
