# Doggy Depot

## Table of Contents
- [Overview](#overview)
- [Product Spec](#product-spec)
- [Wireframes](#wireframes)
- [Schema](#schema)
- [Networking](#networking)

---

## Overview

### Description
Doggy Depot is an interactive app designed for dog owners, providing an intuitive platform to browse, purchase, and manage products for their pets. Users can create personalized pet profiles to receive tailored product recommendations. The app includes a shopping cart, wishlist, and future plans for subscriptions and secure checkout options.

### App Evaluation
- **Category:** E-commerce, Pet Care
- **Mobile:** Primarily designed for mobile, with expansion potential.
- **Story:** Aims to provide a convenient shopping experience for dog owners, offering personalized product recommendations.
- **Market:** Dog owners seeking a streamlined shopping experience.
- **Habit:** Used primarily for shopping as needed.
- **Scope:** Focuses on essential pet care shopping, with room for future features.

---

## Product Spec

### User Stories
**Required Must-have Stories**
[] Users can create an account and log in.
[] Users can create/manage pet profiles with details (breed, age, size, etc.).
[] Users can browse products by category.
[] Users can add products to the shopping cart and wishlist.

**Optional Nice-to-have Stories**
[]Recurring product subscriptions (e.g., for food).
[] Multiple payment options and order tracking.

### Screen Archetypes
[] **Login Screen**: User authentication.
[] **Home Screen**: Browse product categories.
[] **Wish List Screen**: save favourite products.
[] **Product Details Screen**: View product information; add to cart/wishlist.
[] **Shopping Cart Screen**: Review items and proceed to checkout.

---

## Wireframes
<img width="645" alt="Screenshot 2024-11-08 at 8 02 39 PM" src="https://github.com/user-attachments/assets/c626894e-56d0-44a0-9c30-8cd13f1c8221">
<img width="582" alt="Screenshot 2024-11-08 at 8 03 17 PM" src="https://github.com/user-attachments/assets/1a401854-a34c-40a5-a412-04ed5a937fd1">




---

## Schema

### Models

**User**
| Property      | Type       | Description                      |
|---------------|------------|----------------------------------|
| username      | String     | Unique ID for the user           |
| password      | String     | User password                    |
| email         | String     | User email address               |
| address       | String?    | User’s shipping address          |
| shoppingCart  | [Product]  | Products in the shopping cart    |
| wishlist      | [Product]? | Products saved for later         |
| pets          | [Pet]?     | List of registered pets          |

**Pet**
| Property      | Type       | Description                      |
|---------------|------------|----------------------------------|
| name          | String     | Pet's name                       |
| breed         | String     | Pet's breed                      |
| color         | String?    | Pet's color                      |
| size          | String     | Pet's size                       |
| healthIssues  | [String]?  | Health issues                    |
| age           | Int?       | Pet's age                        |
| weight        | Int?       | Pet's weight                     |

**Product**
| Property         | Type      | Description                  |
|------------------|-----------|------------------------------|
| name             | String    | Product name                 |
| brand            | String    | Product brand                |
| category         | String    | Product category             |
| images           | [URL]     | Image URLs                   |
| size             | String?   | Product size                 |
| description      | String    | Product description          |
| relatedProducts  | [Product] | Suggested products           |

---

## Networking

### List of Network Requests by Screen

- **Login Screen**
  - `[POST] /login` - Authenticate user and initiate a session.
  - `[POST] /register` - Register a new user account.

- **Home Screen**
  - `[GET] /products/categories` - Retrieve product categories.
  - `[GET] /products/recommendations` - Retrieve recommended products based on pet profile and preferences.

Progress - Antonella Quiroga

<img src="https://github.com/user-attachments/assets/96df9d54-f5be-41cb-8cfc-59f972fab5ea" alt="Progress Image" width="200" style="border: 1px solid #ddd; padding: 5px; border-radius: 5px;"/>


- **Product Details Screen**
  - `[GET] /products/{productId}` - Retrieve details for a specific product.
  - `[POST] /cart/add` - Add selected product to the user's shopping cart.
  - `[POST] /wishlist/add` - Add product to the user's wishlist.

- **Wishlist Screen**
  - `[GET] /wishlist` - Retrieve all items in the user's wishlist.
  - `[DELETE] /wishlist/remove/{productId}` - Remove a product from the wishlist.
 Progress - Antonella Quiroga

<img src="https://github.com/user-attachments/assets/96df9d54-f5be-41cb-8cfc-59f972fab5ea](https://github.com/user-attachments/assets/a1e665ad-9f72-42dc-ba3d-4ec413ea930b" alt="Progress Image" width="200" style="border: 1px solid #ddd; padding: 5px; border-radius: 5px;"/>


- **Profile Screen**
  - `[GET] /user/{userId}` - Retrieve user profile details, including pet profiles and preferences.
  - `[POST] /user/{userId}/update` - Update user profile, such as adding a shipping address or updating pet information.
  - `[GET] /pets` - Retrieve list of pets associated with the user.
  - `[POST] /pets/add` - Add a new pet profile with details.
  - `[DELETE] /pets/remove/{petId}` - Remove a pet profile.

---

## Parse Network Request Snippets

Here are Parse request snippets for common actions:

**User Login:**
```swift
PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
    if let user = user {
        // Login successful
    } else if let error = error {
        print("Error: \(error.localizedDescription)")
    }
}
---
## add products to cart

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
## Fetch Wishlist

let query = PFQuery(className: "Wishlist")
query.whereKey("userId", equalTo: currentUserId)
query.findObjectsInBackground { (objects, error) in
    if let wishlistItems = objects {
        // Process wishlist items
    } else if let error = error {
        print("Error: \(error.localizedDescription)")
    }
}

## Update Pet Profile

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
https://docs.google.com/document/d/19D33ABBR6yi5WAvkgx1JlFvmGY4uDTgIiH_vPdIV8Mg/edit?usp=sharing
