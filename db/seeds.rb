# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/200/500', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://picsum.photos/300/500', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hey', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hi', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hoot', text: 'This is my fourth post')
comment_1 = Comment.create(post: first_post, author: second_user, text: 'Hi Aladdin!' )
comment_2 = Comment.create(post: first_post, author: first_user, text: 'hello sam!' )
comment_3 = Comment.create(post: first_post, author: second_user, text: 'Hey Tomas!' )
comment_4 = Comment.create(post: first_post, author: first_user, text: 'Hi Tuchel!' )
comment_5 = Comment.create(post: first_post, author: second_user, text: 'how are you!' )
comment_6 = Comment.create(post: first_post, author: first_user, text: 'good items !' )