# Rails template

A simple template for rails.

## Prerequisites

### Postgres

Install Postgres https://www.postgresql.org/download/macosx/
Mac users can use homebrew.

### Yarn

Install YARN https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable

## Running the server

```
bundle install
rails s
```

In another tab you can run webpacker to watch for changes to assets

```
bin/webpack-dev-server
```

## Known issues

If webpacker wont work due to "ERR_OSSL_EVP_UNSUPPORTED" try setting

```
export NODE_OPTIONS=--openssl-legacy-provider
```
