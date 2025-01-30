---
<h1 align="center"> 📸 Image Gallery </h1>

[![Ruby](https://img.shields.io/badge/Ruby-3.3.6-red.svg)](https://www.ruby-lang.org/en/)
[![Rails](https://img.shields.io/badge/Rails-8.0.0-blue.svg)](https://rubyonrails.org/)
[![Turbo](https://img.shields.io/badge/Turbo-green.svg)](https://turbo.hotwired.dev/)
[Heroku](https://secure-brushlands-07741-5f4ceda4c0ca.herokuapp.com/)

A powerful image gallery application built with Ruby on Rails, featuring user authentication, friendly URLs, localization, and background processing.

##  🚀 Features

- Image Handling
    - Supports three image sizes:
        - Full-size for /image/show
        - Medium preview for category listings
        - Thumbnail for admin panel and user avatars
    - Displays only categorized images (uncategorized visible in admin only)
- User & Content Management
    - User authentication with OmniAuth (social login)
    - reCAPTCHA protection
    - Profile page with user details and edit options
- Localization & Friendly URLs
    - Multi-language support using i18n
    - SEO-friendly URLs powered by FriendlyId
- Image Categorization & Navigation
    - Horizontal menu with:
        - Top 5 categories (sorted by images, likes, and comments)
        - All images, sorted by likes
        - All comments, sorted by date
    - Categories page with image filtering
- Scraping & Background Jobs
    - Image extraction from URLs using Nokogiri (admin panel)
    - Background jobs using Resque (email notifications)
    - Email notifications for:
        - New user registration
        - New image in a subscribed category
        - New category subscription
- Real-time Features & Deployment
    - Evaluate ActionCable for real-time updates
    - Deploy to Heroku



## 🛠 Tech Stack

* Backend: Ruby on Rails

* Frontend: ERB, Bootstrap

* Database: PostgreSQL

* Background Jobs: Resque

* Testing: RSpec, Capybara, Selenium

* Deployment: Heroku


## ✅ Testing

**RSpec** for unit and functional tests
**Capybara** + **Selenium** for integration tests


## 📂 Routes Overview

| Page  | Route | Description |
| ------------- | ------------- |------------- |
| Home  | /  | Page with beautiful image gallary  |
| Categories  | /categories  | Page with created categories |
| Category  | /categories/[:name]  | Page with category images, comments  |
| Single Image  | /categories/[:name]/[:id]  | Page with single image(Pinterest like)  |
| Admin  | /admin  | Admin page with logs, lately created stuff  |

## 🚀 Installation & Setup

1. git clone git@github.com:simoneusz/Gallery-On-Rails.git
2. cd Gallery-On-Rails
3. bundle install
4. rails db:create db:migrate db:seed
5. rake app:migrate_images
6. rails server

## 🛠 Development & Contribution

1. Fork the repository
2. Create a new feature branch (git checkout -b feature-name)
3. Commit your changes (git commit -m "Add new feature")
4. Push to your branch (git push origin feature-name)
5. Create a Pull Request
