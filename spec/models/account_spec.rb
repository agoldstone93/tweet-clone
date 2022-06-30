require 'rails_helper'

describe Account do
  let(:account1) { FactoryBot.create(:account) }
  let(:account2) { FactoryBot.create(:account) }
  
  it 'should follow and unfollow an account' do
    expect(account1.following?(account2)).to be_falsey
    account1.follow(account2)
    expect(account1.following?(account2)).to be_truthy
    expect(account2.followers.include?(account1)).to be_truthy
    account1.unfollow(account2)
    expect(account1.following?(account2)).to be_falsey
  end
end