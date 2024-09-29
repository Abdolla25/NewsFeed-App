from flask import Blueprint, request, jsonify
from app.services import post_services as ps

post_routes = Blueprint("posts", __name__)


@post_routes.route("/posts", methods=["POST"])
def create_post_route():
    data = request.get_json()
    content = data.get("content")
    user_id = data.get("user_id")
    response = ps.create_post(content, user_id)
    return jsonify(response), 201


@post_routes.route("/posts/<int:post_id>", methods=["PUT"])
def update_post_route(post_id):
    data = request.get_json()
    content = data.get("content")
    response = ps.update_post(post_id, content)
    return jsonify(response)


@post_routes.route("/posts/<int:post_id>", methods=["DELETE"])
def delete_post_route(post_id):
    response = ps.delete_post(post_id)
    return jsonify(response)


@post_routes.route("/posts/<int:post_id>", methods=["GET"])
def get_post_route(post_id):
    post = ps.get_post(post_id)
    if post:
        return jsonify(
            {
                "id": post[0],
                "content": post[1],
                "user_id": post[2],
                "created_at": post[3],
            }
        )
    else:
        return jsonify({"error": "Post not found"}), 404
