require_relative 'usage'
require_relative 'question'

puts "Enter Student Id:"
student_id = gets.to_i

puts "Enter Question Amount:"
question_amount = gets.to_i

Question.get_student_questions(student_id, question_amount)

