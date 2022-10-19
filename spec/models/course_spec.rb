require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  it '#count_students' do
    student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    student_2 = Student.create!(name: "Harry Potter", age: 11, house: "Gryffindoor")

    defense = Course.create!(name: "Defense against the Dark Arts")
    potions = Course.create!(name: "Potions")

    defense.students << student_1
    defense.students << student_2

    potions.students << student_1

    expect(defense.count_students).to eq(2)
    expect(potions.count_students).to eq(1)
  end

end
