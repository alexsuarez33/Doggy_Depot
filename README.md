https://docs.google.com/document/d/19D33ABBR6yi5WAvkgx1JlFvmGY4uDTgIiH_vPdIV8Mg/edit?usp=sharing

Doggy Depot

Table of Contents
  1. Overview
  2. Product Spec
  3. Wireframes
  4. Schema


Overview
--------
Description
Doggy Depot is an interactive app designed to provide dog owners with a simple and intuitive platform for 
browsing, purchasing, and managing products for their pets. Users can create personalized pet profiles 
to receive tailored product recommendations. The app includes essential shopping functionalities 
such as a shopping cart and wishlist, with future plans to include a subscription service and secure 
checkout for seamless recurring orders and purchases.

App Evaluation
--------------
Category: E-commerce, Pet Care
Mobile: Primarily designed for mobile use, with potential for expansion to other platforms.
Story: The app tells the story of convenience for dog owners, offering personalized product recommendations 
and easy access to a wide range of dog-related products.
Market: The target audience is dog owners seeking a streamlined shopping experience for pet care products and services.
Habit: An occasional-use app, primarily used for shopping.
Scope: Narrow focus on essential pet care shopping with room for future feature expansion.
Product Spec
1. User Stories (Required and Optional)
Required Must-have Stories
Users can create an account and log in.
Users can create and manage pet profiles with details such as breed, age, size, and health preferences.
Users can browse products by category (health, food, grooming, toys, clothes).
Users can add products to the shopping cart and proceed to checkout.
Users can add products to a wishlist for future purchases.
Optional Nice-to-have Stories
Users can subscribe to recurring product orders for essential products like food or health supplies (future feature).
Users can securely check out with multiple payment options and track order status (future feature).


2. Screen Archetypes
Login Screen:
Required User Feature: Users can log in or create an account.
Home Screen:
Required User Feature: Users can browse categories like health, food, toys, clothes, and grooming.
Product Details Screen:
Required User Feature: Users can view product details, add items to the shopping cart or wishlist.
Browsing Screen:
Required User Feature: Users can search and browse available products.
Shopping Cart Screen:
Required User Feature: Users can review items, adjust quantities, and proceed to checkout.


3. Navigation
Tab Navigation (Tab to Screen)
Home Tab: Leads to the home screen displaying product categories.
Profile Tab: Leads to the pet profile screen for managing pet information.
Cart Tab: Leads to the shopping cart screen for reviewing items.
Wishlist Tab: Leads to the wishlist screen for saved products.
Flow Navigation (Screen to Screen)
Home Screen
Leads to Sign In or Registration or Browse screen if button is selected.


Login Screen
Leads to the Browse Screen after successful login.
Registration Screen
Leads to Browse screen when registration is completed.
Browse Screen
Leads to Shopping Cart or Wish List Screen .
Wish List Screen
Leads to Shopping Cart  after editing.
Shopping Cart Screen
Allows purchase of products.


Wireframes


Schema
Models
User
Property
Type
Description
username
String
Unique ID for the user
password
String
Password for login
email
String
Email associated with the user
Address
String?
User’s shipping address
shoppingCart
[product]
Holds the products the user would like to buy
wishlists
[[product]]?
Holds the products the user would like to buy at a later point
pets
[pet]?
All the pets the user has registered





Pet
Property
Type
Description
name
String
Name for the pet
breed
String
Breed of the pet
color
String?
Color of the coat
size
String
Size of the pet
healthIssues
[String]?
Any health issues that the pet has
age
Int?
Age of the pet
weight
Int?
Weight of the pet







Product
Property
Type
Description
name
String
Name of the product
brand
String
Brand of the product
category
String
Category the product belongs to
images
[URL]
URLs of the images of the product
size
String?
Size of the product
description
String
Description of the product
relatedProducts
[product]
List of other products that the user would consider buying based on the current product



Networking
List of Network Requests by Screen
Login Screen
[POST] /login - Authenticate user and initiate a session.
[POST] /register - Register a new user account with username, password, and email.
Home Screen
[GET] /products/categories - Retrieve product categories like health, food, grooming, toys, and clothes.
[GET] /products/recommendations - Retrieve recommended products based on pet profile and user preferences.
Product Details Screen
[GET] /products/{productId} - Retrieve details for a specific product, including name, brand, images, size, and description.
[POST] /cart/add - Add selected product to the user's shopping cart.
[POST] /wishlist/add - Add product to the user's wishlist for future reference.
Browsing Screen
[GET] /products/search?query={keyword} - Retrieve products based on a search keyword across categories.
[GET] /products/category/{categoryName} - Retrieve products by specific category.
Shopping Cart Screen
[GET] /cart - Retrieve current items in the user's shopping cart.
[POST] /cart/update - Update quantity or remove products from the cart.
[POST] /checkout - Proceed to checkout with the current items in the cart.
Wishlist Screen
[GET] /wishlist - Retrieve all items in the user's wishlist.
[DELETE] /wishlist/remove/{productId} - Remove a product from the wishlist.
Profile Screen
[GET] /user/{userId} - Retrieve user profile details, including pet profiles and preferences.
[POST] /user/{userId}/update - Update user profile, such as adding a shipping address or updating pet information.
[GET] /pets - Retrieve list of pets associated with the user.
[POST] /pets/add - Add a new pet profile with details such as breed, age, and health issues.
[DELETE] /pets/remove/{petId} - Remove a pet profile.

Parse Network Request Snippets
Here are Parse request snippets for common actions:
User Login:
PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
    if let user = user {
        // Login successful
    } else if let error = error {
        print("Error: \(error.localizedDescription)")
    }
}

Add Product to Cart:
let cartItem = PFObject(className: "Cart")
cartItem["userId"] = currentUserId
cartItem["productId"] = productId
cartItem.saveInBackground { (success, error) in
    if success {
        print("Product added to cart")
    } else if let error = error {
        print("Error: \(error.localizedDescription)")
    }
}
Fetch Wishlist:
let query = PFQuery(className: "Wishlist")
query.whereKey("userId", equalTo: currentUserId)
query.findObjectsInBackground { (objects, error) in
    if let wishlistItems = objects {
        // Process wishlist items
    } else if let error = error {
        print("Error: \(error.localizedDescription)")
    }
}

Update Pet Profile:
let petQuery = PFQuery(className: "Pet")
petQuery.getObjectInBackground(withId: petId) { (pet, error) in
    if let pet = pet {
        pet["healthIssues"] = newHealthIssues
        pet.saveInBackground { (success, error) in
            if success {
                print("Pet profile updated")
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
