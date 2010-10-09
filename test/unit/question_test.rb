require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup { @question = questions(:worried) }
  
  test 'generate a permalink' do
    question = Question.new :prompt=>'Permalink generated'
    question.valid?
    assert_equal 'permalink-generated', question.permalink
  end
  
  test 'has a prompt' do
    question = Question.new
    question.valid?
    assert !question.errors[:prompt].empty?
  end
  
  test 'has unique prompt' do
    question = Question.new :prompt=>@question.prompt
    question.valid?
    assert !question.errors[:prompt].empty?
  end
  
end
