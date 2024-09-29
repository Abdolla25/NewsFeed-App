CREATE TABLE `User` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(50) UNIQUE,
  `email` VARCHAR(100) UNIQUE,
  `password` VARCHAR(255),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Post` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `content` TEXT,
  `user_id` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Comment` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `content` TEXT,
  `post_id` INT,
  `user_id` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Like` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `post_id` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Share` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `post_id` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Follow` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `follower_id` INT,
  `followed_id` INT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE UNIQUE INDEX `Like_index_0` ON `Like` (`user_id`, `post_id`);

CREATE UNIQUE INDEX `Follow_index_1` ON `Follow` (`follower_id`, `followed_id`);

ALTER TABLE `Post` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`post_id`) REFERENCES `Post` (`id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Like` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Like` ADD FOREIGN KEY (`post_id`) REFERENCES `Post` (`id`);

ALTER TABLE `Share` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

ALTER TABLE `Share` ADD FOREIGN KEY (`post_id`) REFERENCES `Post` (`id`);

ALTER TABLE `Follow` ADD FOREIGN KEY (`follower_id`) REFERENCES `User` (`id`);

ALTER TABLE `Follow` ADD FOREIGN KEY (`followed_id`) REFERENCES `User` (`id`);
