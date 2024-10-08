# News Feed App

## Overview
This is a simple news feed application built with Flask and MySQL. It supports basic functionalities for users to create, read, update, and delete posts.

## Table of Contents
- [Requirements](#requirements)
- [Project Structure](#project-structure)
- [Database ERD](#database-erd)
- [Setup Instructions](#setup-instructions)
  - [Option 1: Running with Docker Compose](#option-1-running-with-docker-compose)
  - [Option 2: Running with Virtual Environment (venv)](#option-2-running-with-virtual-environment-venv)
- [API Endpoints](#api-endpoints)
- [Testing](#testing)
- [License](#license)

## Requirements
- Docker
- Docker Compose
- MySQL
- Python 3.9

## Project Structure
```
/news_feed_app
├── /app
│   ├── /routes
│   │   └── post_routes.py            # Routes for CRUD operations on posts
│   ├── /services
│   │   └── post_service.py            # Business logic for posts
│   ├── /models
│   │   └── db.py                      # MySQL connection logic
│   ├── main.py                        # Entry point for the Flask app
├── /tests
│   └── test_posts.py                  # Unit tests for the API
├── /sql
│   └── schema.sql                     # SQL schema file
├── .env                               # Environment variables for DB connection
├── requirements.txt                   # Python dependencies
└── README.md                          # Project instructions
```

## Database ERD

![Database ERD](db_diagrams/erd_diagram.png)

## Setup Instructions

### Option 1: Running with Docker Compose

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Abdolla25/NewsFeed-App.git
   cd NewsFeed-App
   ```

2. **Copy the .env file**:
   Make sure to copy the `.env.example` file to `.env` and configure the database credentials.
   ```bash
   cp .env.example .env
   ```

3. **Build the Docker Images**:
   ```bash
   docker compose build
   ```

4. **Start the Services**:
   ```bash
   docker compose up
   ```

5. **Prepare the Database**:
   To prepare the database, open a terminal and run the following commands:
   ```bash
   docker compose exec db bash
   mysql -u root -p news_feed_db < /schema.sql
   exit
   ```

6. **Access the Application**:
   Your Flask application will be accessible at `http://localhost:5000`, and the MySQL database will be running at `localhost:3306`.

7. **Stop the Services**:
   To stop the services, use:
   ```bash
   docker compose down
   ```

### Option 2: Running with Virtual Environment (venv)

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Abdolla25/NewsFeed-App.git
   cd NewsFeed-App
   ```

2. **Copy the .env file**:
   Make sure to copy the `.env.example` file to `.env` and configure the database credentials.
   ```bash
   cp .env.example .env
   ```

3. **Create a Virtual Environment**:
   ```bash
   python -m venv venv
   ```

4. **Activate the Virtual Environment**:
   - On Windows:
     ```bash
     venv\Scripts\activate
     ```
   - On macOS/Linux:
     ```bash
     source venv/bin/activate
     ```

5. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

6. **Set Up MySQL**:
   Make sure to have a MySQL server running. Create a database named `news_feed_db`.

7. **Run the Application**:
   ```bash
   EXPORT FLASK_APP=app.main
   flask run
   ```

8. **Prepare the Database**:
   To prepare the database, open a terminal and run the following commands:
   ```bash
   docker compose exec db bash
   mysql -u root -p news_feed_db < /schema.sql
   exit
   ```

9. **Access the Application**:
   Your Flask application will be accessible at `http://localhost:5000`.

## API Endpoints
- **Create a Post**: `POST /posts`
- **Get a Post**: `GET /posts/<id>`
- **Update a Post**: `PUT /posts/<id>`
- **Delete a Post**: `DELETE /posts/<id>`

## Testing
To run the tests, execute the following command:
```bash
python -m unittest discover -s tests
```

## License
This project is licensed under the MIT License.
