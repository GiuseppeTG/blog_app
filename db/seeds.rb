# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Ashe', photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ashe_9.jpg',
            bio: 'I am a boring adc.')
User.create(name: 'Teemo', photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
            bio: 'I place mushrooms everywhere')
User.create(name: 'Jinx', photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_37.jpg',
            bio: 'I am a boring adc.')

Post.create(author: User.find_by(name: 'Ashe'), title: 'Ashe post title', text: 'Ashe post content')
Post.create(author: User.find_by(name: 'Jinx'), title: 'Jinx post title', text: 'Jinx post content')
Post.create(author: User.find_by(name: 'Teemo'), title: 'Teemo post title', text: 'Teemo post content')

Comment.create(post: Post.find_by(text: 'Jinx post content'), author: User.find_by(name: 'Ashe'), text: 'Ashe comment')
Comment.create(post: Post.find_by(text: 'Jinx post content'), author: User.find_by(name: 'Teemo'),
               text: 'Teemo comment')
Comment.create(post: Post.find_by(text: 'Ashe post content'), author: User.find_by(name: 'Teemo'),
               text: 'Teemo comment')
Comment.create(post: Post.find_by(text: 'Teemo post content'), author: User.find_by(name: 'Jinx'), text: 'Jinx comment')
