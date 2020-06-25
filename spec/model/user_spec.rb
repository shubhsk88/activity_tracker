require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { User.create(name: 'Peter', username: 'peter') }
  let!(:session1) { user1.sessions.create(name: 'Hello', amount: 2) }
  let!(:session2) { user1.sessions.create(name: 'Hello1', amount: 5) }
  let!(:session3) { user1.sessions.create(name: 'Hello2', amount: 6) }
  let!(:group) { Group.create(name: 'grouper', icon: '') }
  context 'validations' do
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_length_of(:username).is_at_most(10) }
    it 'should have unique username' do
      user = User.new(name: 'PEter Parker', username: 'peter').save
      expect(user).to eq(false)
    end
  end

  context 'associations' do
    it { should have_many(:sessions).dependent(:destroy) }
    it { should have_many(:groups) }
  end

  describe '#my_sessions' do
    it 'returns  the grouped activities' do
      group.sessions << session1
      group.sessions << session2

      expect(user1.my_sessions.length).to eq(2)
    end
  end

  describe '#my_sessions_count' do
    it 'returns the sum of hours of all grouped activities' do
      group.sessions << session1
      group.sessions << session2
      expect(user1.my_sessions_count).to eq(7)
    end
  end

  describe '#my_external_sessions' do
    it 'returns a list of ungrouped Activites' do
      group.sessions << session1
      group.sessions << session2
      expect(user1.my_external_sessions.length).to eq(1)
    end
  end

  describe '#my_external_sessions_count' do
    it 'returns the sum of hour of all external activities' do
      group.sessions << session1
      group.sessions << session2
      expect(user1.my_external_sessions_count).to eq(6)
    end
  end
end
