# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users ** Users can only delete themselves **
- [x] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

Stretch goals:
- [x] Walks index initially shows only today's walks
- [x] Add dog creation form along with owner
- [ ] Add photo for Dogs
- [ ] Add sort feature to lists
- [ ] Add Rates to owners
- [ ] Add 'delete' confirmation
- [ ] Paginate owners index
- [ ] Add cats!
- [ ] Add 'Pet' class inherited by cats & dogs
- [ ] Add feature: reset/forgot password
- [ ] Add option to make walks recurring
- [ ] Generate invoices with price from walks


Problems:
- Anyone can sign up. Need to default to non-admin
