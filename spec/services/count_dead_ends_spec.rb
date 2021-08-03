require 'rails_helper'

RSpec.describe CountDeadEnds do

    describe 'calculate' do
        let(:room) do
            RoomInteractor::Create.new(
                name: 'test_room',
                m: 4,
                n: 4,
                furniture_count: 1,
                furnitures: [{name: 'coach', start: '(0,1)', end: '(0,2)'}] 
            ).call
        end

        subject do
            described_class.new(created_room).calculate
        end

        it 'result calculated' do
            expect(subject).to eql([1, [[1, 9, 9, 2], [2, 2, 2, 2], [2, 2, 2, 2], [2, 2, 2, 2]]])
        end
    end
end