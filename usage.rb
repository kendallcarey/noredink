require 'csv'

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
    @student_id = attrs['student_id']
    @question_id = attrs['question_id']
    @assigned_hours_ago = attrs['assigned_hours_ago']
    @answered_hours_ago = attrs['answered_hours_ago']
  end
end
