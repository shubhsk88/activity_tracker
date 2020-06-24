# Activity Tracker app with Ruby on Rails

> This app let you track your activity in your daily life and provide the personalised activity dashboard with the option to see the popular activities in your day and provide to link to the different genre like study,health,fitness,etc

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.2

## Live Demo

[Live Link](https://activon.herokuapp.com/)

## Screenshot

![screenshot](https://imgur.com/vJxV68K.png)

## Features

- A user can be signup using username and name and sign in with username.
- Activity can be created by each user and group them into a specific category according to their preferences .
- They can create new groups or use existing groups .
- The user can see a list of grouped activities in "All my Activities".
- The user can see a list of ungrouped activities under "All my external Activities".
- The user can access all existing groups and see the activities that belong to that group, together with the author's name, by clicking "All groups".
- The user can see a list of their 5 most popular activities did in the day and a total of hours for those activities.

## Getting Started

- Clone the repository using `https://github.com/shubhsk88/learning_tracker.git`

### Prerequisites

Ruby: 2.7.0
Rails: 6.0.2
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate

```

### Usage

Start server with:

```

    rails server

```

Open `http://localhost:3000/` in your browser.

### Run tests

```

    bundle exec rspec

```

## Authors

👤 **Shubham Singh**

- Github: [@shubhsk88](https://github.com/shubhsk88)
- Twitter: [@shubhski](twitter.com/shubski)
- Linkedin: [linkedin](https://www.linkedin.com/in/shubhski/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Rails Documentation
- Behance design by [Gregoire Vella](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)
