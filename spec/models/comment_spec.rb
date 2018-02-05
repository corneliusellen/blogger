require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
    it {should validate_presence_of(:author_name)}
    it {should validate_presence_of(:body)}
    it {should belong_to(:article)}
  end
end
