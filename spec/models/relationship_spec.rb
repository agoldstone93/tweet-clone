require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:account1) { FactoryBot.create(:account) }
  let(:account2) { FactoryBot.create(:account) }
  let(:relationship) { FactoryBot.create(:relationship) }

  it 'should be valid' do
    expect(relationship).to be_valid
  end

  it 'should require a follower_id' do
    relationship.follower_id = nil
    expect(relationship).to_not be_valid
  end

  it 'should require a followed_id' do
    relationship.followed_id = nil
    expect(relationship).to_not be_valid
  end
end
