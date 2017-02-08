class Question
  require 'csv'

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
