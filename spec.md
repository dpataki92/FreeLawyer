# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category) - I used 4 model classes: client, lawyer, question, answer
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - I used more than one has_many relationship, also has_many :through relationships (e.g. a lawyer has many answers and has many questions through answers)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - I included more than one belongs_to relationship (e.g. a questions belongs to a client)
- [x] Include user accounts with unique login attribute (username or email) - I used ActiveRecord validation methods for username/email uniqueness and also cross-checked between client and lawyer models to prevent users of one model having a username that is identical with a username of the other model
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Clients have routes for creating, reading, updating and deleting questions, while lawyers have routes for reading questions, creating and deleting answers 
- [x] Ensure that users can't modify content created by other users - By using sessions, the app makes sure that edit / delete buttons only appear if the given question / answer belongs to the current user
- [x] Include user input validations - I included client-side / server-side validations such as requiring certain input data, using the has_secure_password macro and the authenticate method, checking if different login / signup data belongs to the same user
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - I used flash messages for letting users know if the provided login/signup data is incorrect, also for sending success messages upon successful login or signup
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - I provided a brief readme file with the necessary content

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
