require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'has a title' do
      p = Post.new

      p.valid?

      expect(p.errors).to have_key(:title)

    end

    it 'has a title with at least 7 characters' do
      p = Post.new({title: "123456"})

      p.valid?

      expect(p.errors).to have_key(:title)
    end

    it 'has a body' do
      p = Post.new

      p.valid?

      expect(p.errors).to have_key(:body)

    end

    it 'returns a body snippet' do
      p = Post.new({body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})


      result = ((p.body_snippet.length) - 3)

      expect(result).to eq(100)

    end
  end
end
