require 'csv'

class Question

  attr_accessor :strand_id,
                :strand_name,
                :standard_id,
                :standard_name,
                :question_id,
                :difficulty

  def self.load_from_csv
    csv = CSV.read('questions.csv', headers:true)
    questions = []
    csv.each do |row|
      questions << self.new(row.to_hash)
    end
    return questions
  end

  def initialize(attrs = {})
    @strand_id = attrs['strand_id']
    @strand_name = attrs['strand_name']
    @standard_id = attrs['standard_id']
    @standard_name = attrs['standard_name']
    @question_id = attrs['question_id']
    @difficulty = attrs['difficulty']
  end
  def self.get_student_questions(student_id, question_amount)
    questions = load_from_csv
    raise 'invalid question amount' if question_amount.nil? || question_amount <= 0
    raise 'student id required' if student_id.nil?

    # sort questions into strands
    sorted_questions = questions.group_by{|question| question.strand_id}
    student_question_ids = []

    strand_index = 0
    question_index = 0
    loop do
      strand_key = sorted_questions.keys[strand_index]
      strand_questions = sorted_questions[strand_key]
      question_index = 0 if question_index > strand_questions.size - 1
      question = strand_questions[question_index]

      student_question_ids << question.question_id if !question.nil?
      question_index += 1
      strand_index += 1
      strand_index = 0 if strand_index > sorted_questions.keys.size - 1
      break if student_question_ids.size == question_amount
    end

    return student_question_ids
  end
end
