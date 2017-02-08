require_relative 'usage'

describe Usage  do
  it 'should load the usage csv' do
    usage = Usage.load_from_csv
    expect(usage.length > 0).to be true
  end
end
