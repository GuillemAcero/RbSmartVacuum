require 'rails_helper'

RSpec.describe FurnitureInteractor::Create do

    describe 'call' do
        let(:name) { 'coach' }
        let(:start_p) { '(1,1)' }
        let(:end_p) { '(2,2)' }
        let(:room) do 
            Room.new(
                name: 'test_room', 
                m: 3,
                n: 3,
                furniture_count: 1
            )
        end

        subject do
            described_class.new(
                name: name,
                start_p: start_p,
                end_p: end_p,
                room: room
            ).call
        end

        it 'furniture created' do
            expect { subject }.to change { Furniture.count }.by(1)

            expect(subject).to have_attributes(
                name: name,
                start_p: start_p,
                end_p: end_p
            )
        end
    end
end