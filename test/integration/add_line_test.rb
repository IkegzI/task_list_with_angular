require 'test_helper'

class AddLineTest < ActionDispatch::IntegrationTest

  # test "can create" do
  #   #   assert true
  #   post '/todos',
  #        params: YAML.load_file(Dir.pwd + "/public/seeds.yml")
  # end
  #
  # test "index projects" do
  #   #   assert true
  #   get '/projects'
  #
  # end
  # test "index projects" do
  #   #   assert true
  #   patch '/project/1/todos/2'
  #
  # end

  test "index projects" do
    #   assert true
    post '/todos',
           params: {task: {text: '1211231', isCompleted: false}}

  end

end
