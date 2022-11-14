# Development

## How to start a local server?

- Run the following command:

  ```bash
  cd ~/Projects/code_review && bundle exec rails server
  ```

- Open [http://localhost:3000](http://localhost:3000/) in your browser.

# Seeds

## How to create a user?

- Open Rails console:

  ```bash
  cd ~/Projects/code_review && bundle exec rails console
  ```

- Execute the command below:

  ```ruby
  User.create!(email: "user@example.com", password: "secret")
  ```

- Don't forget to replace email and password.
