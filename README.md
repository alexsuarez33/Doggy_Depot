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
- Users can create an account and log in.
- Users can create/manage pet profiles with details (breed, age, size, etc.).
- Users can browse products by category.
- Users can add products to the shopping cart and wishlist.

**Optional Nice-to-have Stories**
- Recurring product subscriptions (e.g., for food).
- Multiple payment options and order tracking.

### Screen Archetypes
- **Login Screen**: User authentication.
- **Home Screen**: Browse product categories.
- **Product Details Screen**: View product information; add to cart/wishlist.
- **Shopping Cart Screen**: Review items and proceed to checkout.

---

## Wireframes
![Wireframes](link-to-your-wireframes-image) <!-- Replace with actual link to your wireframe images if available -->

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
  - `[POST] /login` - User login.
  - `[POST] /register` - User registration.

- **Home Screen**
  - `[GET] /products/categories` - Fetch product categories.
  - `[GET] /products/recommendations` - Fetch recommended products.

- **Product Details Screen**
  - `[GET] /products/{productId}` - Get product details.
  - `[POST] /cart/add` - Add to cart.
  - `[POST] /wishlist/add` - Add to wishlist.

- **Shopping Cart Screen**
  - `[GET] /cart` - View cart items.
  - `[POST] /checkout` - Proceed to checkout.

---


https://docs.google.com/document/d/19D33ABBR6yi5WAvkgx1JlFvmGY4uDTgIiH_vPdIV8Mg/edit?usp=sharing
