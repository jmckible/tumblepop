require 'test_helper'

class Admin::QuestionsControllerTest < ActionController::TestCase

  test '/admin/questions with GET' do
    get :index
    assert_response :success
  end
  
  test '/admin/questions/:id with GET' do
    get :index, :id=>questions(:worried).to_param
    assert_response :success
  end
  
  test '/admin/questions/new with GET' do
    get :new
    assert_response :success
  end
  
  test '/admin/questions with valid params and POST' do
    assert_difference('Question.count') do
      post :create, :question=>{:prompt=>'new question'}
    end
    assert_redirected_to admin_question_path(assigns(:question))
  end
  
  test '/admin/questions with invalid params and POST' do
    assert_no_difference('Question.count') do
      post :create
    end
    assert_response :success
    assert_template :new
  end
  
  test '/admin/questions/:id with valid params and PUT' do
    question = questions(:worried)
    put :update, :id=>question.to_param, :question=>{:prompt=>'updated'}
    assert_equal 'updated', question.reload.prompt
    assert_redirected_to admin_question_path(question)
  end
  
  test '/admin/questions/:id with invalid params and PUT' do
    question = questions(:worried)
    put :update, :id=>question.to_param, :question=>{:prompt=>''}
    assert_not_equal '', question.prompt
    assert_response :success
    assert_template :show
  end

end
