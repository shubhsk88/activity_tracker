require 'rails_helper'

RSpec.describe Group, type: :model do

    
    
    context 'validations' do
      it { should validate_length_of(:name).is_at_most(30) }
      

      it 'validate the presence of icon' do
          group=Group.new(name:"grouper",icon:"").save

          expect(group).to eq(true)
      end
    end

  
    context 'associations' do
      it { should have_many(:sessions)}
      
    end
end