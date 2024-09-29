Table User {
  id INT [pk, increment]
  username VARCHAR(50) [unique]
  email VARCHAR(100) [unique]
  password VARCHAR(255)
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Post {
  id INT [pk, increment]
  content TEXT
  user_id INT [ref: > User.id]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Comment {
  id INT [pk, increment]
  content TEXT
  post_id INT [ref: > Post.id]
  user_id INT [ref: > User.id]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Like {
  id INT [pk, increment]
  user_id INT [ref: > User.id]
  post_id INT [ref: > Post.id]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]

  Indexes {
    (user_id, post_id) [unique]
  }
}

Table Share {
  id INT [pk, increment]
  user_id INT [ref: > User.id]
  post_id INT [ref: > Post.id]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]
}

Table Follow {
  id INT [pk, increment]
  follower_id INT [ref: > User.id]
  followed_id INT [ref: > User.id]
  created_at TIMESTAMP [default: `CURRENT_TIMESTAMP`]

  Indexes {
    (follower_id, followed_id) [unique]
  }
}
