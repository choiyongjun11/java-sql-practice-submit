CREATE TABLE `Users` (
    `user_id` bigint PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE `Boards` (
    `board_id` bigint PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` text
);

CREATE TABLE `Posts` (
    `post_id` bigint PRIMARY KEY AUTO_INCREMENT,
    `title` varchar(255) not null,
    `content` text not null,
    `user_id` bigint,
    `board_id` bigint,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
    FOREIGN KEY (`board_id`) REFERENCES `Boards` (`board_id`)
);

CREATE TABLE `Comments` (
    `comment_id` bigint PRIMARY KEY AUTO_INCREMENT,
    `content` text not null,
    `user_id` bigint,
    `post_id` bigint,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
    FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`)
);

CREATE TABLE `Tags`(
    `tag_id` bigint PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) not null

);

CREATE TABLE `Post_Tags`(
    `post_id` bigint,
    `tag_id` bigint,
    FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`),
    FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`tag_id`)
);
