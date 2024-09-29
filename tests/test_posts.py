import unittest
import json
from app.main import app


class PostTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_create_post(self):
        payload = {"content": "Test post", "user_id": 1}
        response = self.app.post(
            "/posts", data=json.dumps(payload), content_type="application/json"
        )
        self.assertEqual(response.status_code, 201)
        self.assertIn(b"Post created successfully", response.data)

    def test_get_post(self):
        response = self.app.get("/posts/1")
        self.assertEqual(response.status_code, 200)

    def test_update_post(self):
        payload = {"content": "Updated post content"}
        response = self.app.put(
            "/posts/1", data=json.dumps(payload), content_type="application/json"
        )
        self.assertEqual(response.status_code, 200)
        self.assertIn(b"Post updated successfully", response.data)

    def test_delete_post(self):
        response = self.app.delete("/posts/1")
        self.assertEqual(response.status_code, 200)
        self.assertIn(b"Post deleted successfully", response.data)


if __name__ == "__main__":
    unittest.main()
