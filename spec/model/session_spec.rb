require 'rails_helper'

RSpec.describe Session, type: :model do

    
    
    context 'validations' do
      it { should validate_presence_of(:amount)}
      it { should validate_numericality_of(:amount) }
      it { should validate_presence_of(:name)}
   
      
      

      it 'validate the presence of icon' do
          group=Group.new(name:"grouper",icon:"").save

          expect(group).to eq(true)
      end
    end

  
    context 'associations' do
      it { should have_many(:groups)}
      
      it { should belong_to(:author).class_name('User')}
    end
end