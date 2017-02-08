require_relative 'solution'

describe Question do

  it 'should load the questions' do
      questions = Question.load_from_csv
      expect(questions.length > 0).to be true
  end

end


