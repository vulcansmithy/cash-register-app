## Live URL

[https://serene-bastion-13776-76f5fc30d828.herokuapp.com/](https://serene-bastion-13776-76f5fc30d828.herokuapp.com/)



## Notable Notes about the Cashier Registery app

- Uses PostgreSQL as specified
- Implements proper migrations and seed data
- Follows TDD methodology with comprehensive tests
- Uses FactoryBot for test fixtures
- Implements pricing rules according to specifications
- Provides a simple, functional interface
- Follows Rails best practices
- Handles money calculations properly using money-rails
- The cashier cart (in the form CartItem) is process by a `CartService` class
- Rules based from the spec documents are implemented in a form of Rules Engines defined under `/app/services/pricing_rules`

## Things need improving

- The web interface could be better. Currently there's only "remove" function in the Cash Register app. Ideally, there is also "Subtract", e.g., added 3 Green Tea. Use "Subtract" to reduce from 3 items to 2 items.
- Just notice the display of the value when whole number doesn't display the cent value. e.g, if the price is 14.00, it just display it as "€14". This may change. I might be updating the app to fix this issue. As of now my priority to deploy a working version online

## Screenshots
![Dashboard View](/app/assets/images/screenshots/screenshot-01.png)
![Dashboard View](/app/assets/images/screenshots/screenshot-02.png)
![Dashboard View](/app/assets/images/screenshots/screenshot-03.png)
