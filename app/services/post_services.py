from app.models.db import get_db_connection


def create_post(content, user_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute(
        "INSERT INTO Post (content, user_id) VALUES (%s, %s)", (content, user_id)
    )
    connection.commit()
    cursor.close()
    connection.close()
    return {"message": "Post created successfully"}


def update_post(post_id, content):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("UPDATE Post SET content = %s WHERE id = %s", (content, post_id))
    connection.commit()
    cursor.close()
    connection.close()
    return {"message": "Post updated successfully"}


def delete_post(post_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("DELETE FROM Post WHERE id = %s", (post_id,))
    connection.commit()
    cursor.close()
    connection.close()
    return {"message": "Post deleted successfully"}


def get_post(post_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Post WHERE id = %s", (post_id,))
    post = cursor.fetchone()
    cursor.close()
    connection.close()
    return post
