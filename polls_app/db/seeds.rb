# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jg = User.create!(username: 'Joe Gallup')
nk = User.create!(username: 'Ned Kush')
gj = User.create!(username: 'George Jorge')
kn = User.create!(username: 'Kyle Ned')

poll1 = Poll.create!(user_id: jg.id, title: 'Food Preferences')
poll2 = Poll.create!(user_id: nk.id, title: 'Would you rather...?')

question1a = Question.create!(poll: poll1, text: 'Favorite Ice Cream')
question1b = Question.create!(poll: poll1, text: 'Favorite Pizza Topping')
question2a = Question.create!(poll: poll1, text: 'Fight a horse-sized Duck or 100 duck-sized Horses')
question2b = Question.create!(poll: poll1, text: 'Lick a foot or have an eel dropped in your pants')

answer_choice1a1 = AnswerChoice.create!(question_id: question1a.id, text: "Chocolate")
answer_choice1a2 = AnswerChoice.create!(question_id: question1a.id, text: "Vanilla")
answer_choice1b1 = AnswerChoice.create!(question_id: question1b.id, text: "Pineapple")
answer_choice1b2 = AnswerChoice.create!(question_id: question1b.id, text: "Pepperoni")

answer_choice2a1 = AnswerChoice.create!(question: question2a, text: "Horse-sized Duck")
answer_choice2a2 = AnswerChoice.create!(question: question2a, text: "100 duck-sized Horses")
answer_choice2b1 = AnswerChoice.create!(question: question2b, text: "Lick a foot")
answer_choice2b2 = AnswerChoice.create!(question: question2b, text: "Have an eel dropped in your pants")


response1a1 = Response.create!(answer_choice_id: answer_choice1a1.id, user_id: gj.id)
response1a2 = Response.create!(answer_choice_id: answer_choice1a2.id, user_id: nk.id)
response1b1 = Response.create!(answer_choice_id: answer_choice1b1.id, user_id: kn.id)
response1b2 = Response.create!(answer_choice_id: answer_choice1b2.id, user_id: jg.id)
