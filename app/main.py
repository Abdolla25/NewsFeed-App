from flask import Flask
from app.routes.post_routes import post_routes

app = Flask(__name__)

app.register_blueprint(post_routes)

if __name__ == "__main__":
    app.run(debug=True)
