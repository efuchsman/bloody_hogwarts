# User Story 1 of 4

# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")

require 'rails_helper'

RSpec.describe "Students Index" do
  describe "As a visitor" do
    describe "When I visit '/students'" do
      it "I see a list of students with the following information:-Name-Age-House" do
      student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

      visit "/students"

      expect(page).to have_content(student.name)
      expect(page).to have_content(student.age)
      expect(page).to have_content(student.house)
      end
    end
  end
end
