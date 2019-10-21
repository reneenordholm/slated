# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project<br>
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) <br>
        --> Clients, Concierges, Services, and Stylists all utilize the has_many Association
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)<br>
        --> Appointments belongs_to Clients, Concierges, Services, and Stylists
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)<br>
        --> Clients, Concierges, Services, and Stylists all utilize the has_many :through Association
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)<br>
        --> Clients, Concierges, Services, and Stylists all utilize the many-to-many Association
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)<br>
       --> Can update or change information through client/stylist appointments path.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)<br>
        --> Most models utilize validations and error messages.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)<br>
        --> Can view stylist with most booked appointments at /most_booked.
- [x] Include signup (how e.g. Devise)<br>
        --> Concierge accepts new user sign up
- [x] Include login (how e.g. Devise)<br>
        --> Concierge accepts new user sign up
- [x] Include logout (how e.g. Devise)<br>
        --> Concierge accepts new user sign up
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)<br>
        --> User can sign in/up via Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)<br>
        --> Can view appointments by client and stylist
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)<br>
        --> Client and Stylist can create a new appointment through nested resources 
- [x] Include form display of validation errors (form URL e.g. /recipes/new)<br>
        --> Forms display validation error messages

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate