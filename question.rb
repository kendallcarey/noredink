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
    sorted_questions = {}
    # sort questions into strands
    questions.each do |question|
      sorted_questions[question.strand_id] ||= []
      sorted_questions[question.strand_id] << question
    end
    # sort questions into standards
    sorted_questions.each do |strand_id, questions|
      questions.sort!{|a, b| a.standard_id <=> b.standard_id }
    end

    puts sorted_questions.first.inspect

  end
end
