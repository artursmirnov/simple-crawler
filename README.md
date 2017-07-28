# Simple Crawler [![CircleCI](https://circleci.com/gh/artursmirnov/simple-crawler.svg?style=svg)](https://circleci.com/gh/artursmirnov/simple-crawler/tree/master)

> This simple Ruby on Rails application parses page contents and stores them in database classifying by type.

## How to use

This application exposes RESTful API endpoints for interactions by any HTTP client. For example, [Postman](https://www.getpostman.com/) is a really nice tool.

Here's the simplest way to go:

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a39f8a598fe7be1e2ad8)

Also the Postman collection can be [downloaded](SimpleCrawler.postman_collection.json) and imported manually.

### Endpoints

#### `GET /pages`

Fetches all saved pages with their contents

_Response payload_

```json
{
    "pages": [
        {
            "id": 1,
            "url": "http://google.com",
            "created_at": "2017-07-28T19:54:14.638Z",
            "updated_at": "2017-07-28T19:54:14.638Z",
            "contents": [
                {
                    "id": 1,
                    "kind": "a",
                    "value": "Images",
                    "page_id": 1,
                    "created_at": "2017-07-28T19:54:14.843Z",
                    "updated_at": "2017-07-28T19:54:14.843Z"
                }
            ]
        }
    ]
}
```

#### `GET /pages/:id`

Fetches a single parsed page

_Response payload_

```json
{
    "page": {
        "id": 4,
        "url": "https://artursmirnov.com/",
        "created_at": "2017-07-28T20:32:14.318Z",
        "updated_at": "2017-07-28T20:32:14.318Z",
        "contents": [
            {
                "id": 16,
                "kind": "a",
                "value": "Home",
                "page_id": 4,
                "created_at": "2017-07-28T20:32:15.183Z",
                "updated_at": "2017-07-28T20:32:15.183Z"
            }
        ]
     }
}
```



#### `POST /pages`

Creates a new page and parses its contents

_Request payload_

```json
{
  "page": {
    "url": ""
  }
}
```

_Response payload_

```json
{
    "page": {
        "id": 4,
        "url": "https://artursmirnov.com/",
        "created_at": "2017-07-28T20:32:14.318Z",
        "updated_at": "2017-07-28T20:32:14.318Z",
        "contents": [
            {
                "id": 16,
                "kind": "a",
                "value": "Home",
                "page_id": 4,
                "created_at": "2017-07-28T20:32:15.183Z",
                "updated_at": "2017-07-28T20:32:15.183Z"
            }
        ]
     }
}
```

#### `DELETE /pages/:id`

Deletes a page and all its contents


## Running locally

### Requirements

- git
- Ruby v2.4
- Rails 5.1.2

### Instructions:

- `git clone git@github.com:artursmirnov/simple-crawler.git`
- `cd simple-crawler`
- `bundle install --without=production`
- `rake db:migrate`
- `rails s`

## Running tests

`bundle exec rspec` or `rake`

