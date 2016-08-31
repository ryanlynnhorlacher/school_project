require 'rails_helper'

RSpec.describe School, type: :model do
 describe 'validations' do 
 	it {should validate_presence_of(:name)}
 	it {should validate_presence_of(:rating)}
 	it {should validate_presence_of(:level)}
 end
 describe '#by_name' do 
 	it 'returns schools ordered by name' do 
 		school1 = School.create(name: 'C', rating: 6, level: 'Elementary')
 		school2 = School.create(name: 'A', rating: 6, level: 'Elementary')
 		school3 = School.create(name: 'B', rating: 6, level: 'Elementary')
 		expect(School.all.by_name.first).to eq(school2)
 		expect(School.all.by_name.last).to eq(school1)
 	end
 end

 describe '#by_rating' do
 	it 'returns schools ordered by rating' do 
	 	school1 = School.create(name: 'C', rating: 6, level: 'Elementary')
	 	school2 = School.create(name: 'A', rating: 10, level: 'Elementary')
	 	school3 = School.create(name: 'B', rating: 8, level: 'Elementary')
	 	expect(School.all.by_rating.first).to eq(school1)
	 	expect(School.all.by_rating.last).to eq(school2)
	 end
 end
 describe '.rating_stars' do 
 	it 'should return a rating out of 5 stars' do 
	 	school2 = School.create(name: 'A', rating: 10, level: 'Elementary')
	 	expect(school2.rating_stars).to eq('5 stars')
 	end
 end
end
