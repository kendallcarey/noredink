require_relative 'question'

describe Question do

  it 'should load the questions' do
      questions = Question.load_from_csv
      expect(questions.length > 0).to be true
  end

  describe '.get_student_questions' do
    result = Question.get_student_questions(1,1)
    expect(result.length == 1).to be true
  end
end
