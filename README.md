# News Feed App

A simple news feed app built with Flask and MySQL.

## Project Structure

- **/db_diagrams/**: Contains the ERD script and diagram.
- **/app/**: Flask application code.
- **/tests/**: Unit tests for API endpoints.
- **/sql/**: SQL script to create the database schema.

## Setup Instructions

1. **Clone the Repo**:
   ```bash
   git clone https://github.com/Abdolla25/NewsFeed-App.git
   cd NewsFeed-App
   ```

2. **Install Dependencies**: Create a virtual environment and install dependencies:
    ```bash
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

3. **Set Up MySQL Database**:
- Import the schema using the schema.sql script:
    ```bash
    mysql -u root -p < /sql/schema.sql
    ```

4. **Run the Flask App**:
    ```bash
    flask run
    ```

5. **Test the API**: You can test the API using tools like Postman or `curl`.

## Endpoints
- `POST /posts`: Create a new post.
- `PUT /posts/<id>`: Update a post.
- `DELETE /posts/<id>`: Delete a post.
- `GET /posts/<id>`: Get a specific post.

## ERD Diagram
The ERD diagram is available in `db_diagrams/erd_diagram.png`.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
