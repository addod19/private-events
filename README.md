# Private events project using Ruby on Rails

In this project we build a site similar to a private Eventbrite which allows users to create events and then manage user signups. Users can create events. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”). A user can create events. A user can attend many events. An event can be attended by many users.

## Screenshot

![screenshot](assets/images/Screenshot.jpg)

## Getting started

To get started with the app, first clone the repo

```
git clone  https://github.com/addod19/private-events.git
```

Then install the needed gems:

```
bundle install --without production
```

Next, migrate the database:

```
 rails db:migrate
```

Finally, run the app in a local server:

```
 rails server
```

## Contributors

1. [Daniel Larbi Addo](www.github.com/addod19)
2. [Nick Haralampopoulos](www.github.com/macnick)

To see more information and learn about Rails check this [Ruby on Rails](https://www.railstutorial.org/book) Tutorial book.
