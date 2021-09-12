# frozen_string_literal: true

require 'test_helper'

class AdminPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get admin_pages_url
    assert_response :success
  end
end
