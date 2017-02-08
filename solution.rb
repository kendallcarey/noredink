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
    csv.each do |row|
      puts row.to_hash
      self.new(row.to_hash)
    end
  end

  def initialize(attrs = {})
    @strand_id = attrs[:strand_id]
    @strand_name = attrs[:strand_name]
    @standard_id = attrs[:standard_id]
    @standard_name = attrs[:standard_name]
    @question_id = attrs[:question_id]
    @difficulty = attrs[:difficulty]
  end
end

class Usage
  attr_accessor :student_id,
                :question_id,
                :assigned_hours_ago,
                :answered_hours_ago

  def self.load_from_csv
    csv = CSV.read('usage.csv', headers:true)
    csv.each do |row|
      puts row.to_hash
      self.new(row.to_hash)
    end
  end
    def initialize(attrs = {})
    @student_id = attrs[:student_id]
    @question_id = attrs[:question_id]
    @assigned_hours_ago = attrs[:assigned_hours_ago]
    @answered_hours_ago = attrs[:answered_hours_ago]
  end
end

