# Restaurant Reviews – Backend (Rails API)

Backend API for the **Restaurant Reviews** platform, built with **Ruby on Rails**.  
Provides endpoints for managing restaurants, reviews, and search functionality.  
Designed to be consumed by the [React frontend](https://github.com/mricanho/restaurant_reviews_frontend).

---

## 🚀 Features

- **List restaurants** with optional search by name.
- **View restaurant details** with associated reviews.
- **Create restaurants** via POST requests.
- **Add reviews** for a specific restaurant.
- Returns JSON responses for all endpoints.
- CORS enabled for frontend integration.

---

## 🛠️ Tech Stack

- **Ruby on Rails** (API mode)
- **PostgreSQL** as the database
- **Rack-CORS** for cross-origin requests
- **dotenv-rails** for environment variables
- **Fast JSONAPI** (optional) for serialization

---

## ⚙️ Environment Variables

Create a `.env` file in the project root to store sensitive configuration if needed.

Example:
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password

---

## 🖥️ Setup & Run

### 1. Install dependencies

`bundle install`


### 2. Database setup

`rails db:create db:migrate db:seed`

### 2. Run the server

`rails s`

The API will be available at:

http://localhost:3000

---

## 🔗 API Endpoints

List restaurants

GET /restaurants[?q=search_term]

Response:

```
{
  "id": 1,
  "name": "Tacos El Astro",
  "description": "Al pastor tacos",
  "avg_rating": 4.5,
  "reviews": [
    { "id": 1, "content": "Delicious!", "rating": 5, "created_at": "..." }
  ]
}
```

Show restaurant details

GET /restaurants/:id

Response:
```
{
  "id": 1,
  "name": "Tacos El Astro",
  "description": "Al pastor tacos",
  "avg_rating": 4.5,
  "reviews": [
    { "id": 1, "content": "Delicious!", "rating": 5, "created_at": "..." }
  ]
}
```

Create a restaurant

POST /restaurants
```
{ "restaurant": { "name": "Sushi Go", "description": "Nigiris and rolls" } }
```

Create a review

POST /restaurants/:id/reviews

Body:

```
{ "review": { "content": "Very fresh", "rating": 5 } }
```

Response:
```
{
  "review": { "id": 10, "content": "Very fresh", "rating": 5, "created_at": "..." },
  "restaurant": { "id": 1, "name": "Sushi Go", "avg_rating": 4.7 }
}
```
---

## 📦 Seeding Data

The db/seeds.rb file contains sample restaurants and reviews for local testing.

Run:

`rails db:seed`

---

## 📄 License

MIT License – feel free to use this project for learning or as a starting point for your own apps.
