require_relative 'usage'
require_relative 'question'

puts "Enter Student Id:"
student_id = gets

puts "Enter Question Amount:"
question_amount = gets

Question.get_student_questions(student_id, question_amount)

