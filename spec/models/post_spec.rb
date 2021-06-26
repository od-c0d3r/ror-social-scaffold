require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@test.com', password: '123456') }
  let(:post) { Post.create(content: 'this is my content', user_id:user.id ) }

  it 'is valid with existing content' do
    expect(post).to be_valid
  end

  it 'is not valid with non-existing content' do
    post.update_attributes(content:' ')
    expect(post).not_to be_valid
  end
end
