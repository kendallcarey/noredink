require_relative 'question'

describe Question do

  it 'should load the questions' do
      questions = Question.load_from_csv
      expect(questions.length > 0).to be true
  end

  describe '.get_student_questions' do

    it 'should error if the question amount is nil or less than 1' do
      expect {
        Question.get_student_questions(1, nil)
      }.to raise_error

      expect {
        Question.get_student_questions(1, -1)
      }.to raise_error
    end

    it 'should return question  ids' do
      result = Question.get_student_questions(1,1)
      expect(result.length == 1).to be true
    end
  end
end
