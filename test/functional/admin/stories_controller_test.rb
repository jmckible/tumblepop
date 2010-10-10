require 'test_helper'

class Admin::StoriesControllerTest < ActionController::TestCase
  setup { login :admin }

  test '/admin/stories with GET' do
    get :index
    assert_response :success
  end
  
  test '/admin/stories/:id with GET' do
    get :index, :id=>stories(:jordan_worried).to_param
    assert_response :success
  end
  
  test '/admin/stories/:id with valid params and PUT' do
    story = stories(:jordan_worried)
    put :update, :id=>story.to_param, :story=>{:title=>'updated'}
    assert_equal 'updated', story.reload.title
    assert_redirected_to admin_story_path(story)
  end
  
  test '/admin/stories/:id with invalid params and PUT' do
    story = stories(:jordan_worried)
    put :update, :id=>story.to_param, :story=>{:title=>''}
    assert_not_equal '', story.title
    assert_response :success
    assert_template :show
  end

end
