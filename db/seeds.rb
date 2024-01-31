# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/200/500', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://picsum.photos/300/500', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, Title: 'Hello', Text: 'This is my first post')
second_post = Post.create(author: first_user, Title: 'Hey', Text: 'This is my second post')
third_post = Post.create(author: first_user, Title: 'Hi', Text: 'This is my third post')
fourth_post = Post.create(author: first_user, Title: 'Hoot', Text: 'This is my fourth post')
comment_1 = Comment.create(post: first_post, author: second_user, Text: 'Hi Aladdin!' )
comment_2 = Comment.create(post: first_post, author: first_user, Text: 'hello sam!' )
comment_3 = Comment.create(post: first_post, author: second_user, Text: 'Hey Tomas!' )
comment_4 = Comment.create(post: first_post, author: first_user, Text: 'Hi Tuchel!' )
comment_5 = Comment.create(post: first_post, author: second_user, Text: 'how are you!' )
comment_6 = Comment.create(post: first_post, author: first_user, Text: 'good items !' )