require 'rails_helper'

RSpec.describe RoomInteractor::Create do

    describe 'call' do
        let(:name) { 'first_room' }
        let(:m) { 3 }
        let(:n) { 3 }
        let(:furniture_count) {0}
        let(:furnitures) { [] }

        subject do
            described_class.new(
                name: name,
                m: m,
                n: n,
                furniture_count: furniture_count,
                furnitures: furnitures
            ).call
        end

        context 'without furnitures' do
            it do
                expect { subject }.to change { Room.count }.by(1).and change { Furniture.count}.by(0)

                expect(subject).to have_attributes(
                    name: name,
                    m: m,
                    n: n,
                    furniture_count: furniture_count
                )
            end
        end

        context 'without furnitures' do
            let(:furnitures) {  [{name: 'coach', start: '(0,1)', end: '(0,1)'}] }
            it do
                expect { subject }.to change { Room.count }.by(1).and change { Furniture.count}.by(1)

                expect(subject).to have_attributes(
                    name: name,
                    m: m,
                    n: n,
                    furniture_count: furniture_count
                )
            end
        end
    end
end