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

      it "lists the average age of the students" do
        student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        student_2 = Student.create!(name: "Harry Potter", age: 11, house: "Gryffindoor")
        student_3 = Student.create!(name: "Rusty Shackleford", age: 13, house: "Gryffindoor")

        visit "/students"
        # save_and_open_page
        expect(page).to have_content("Average Age:")
        expect(page).to have_content(Student.average_age)

      end
    end
  end
end
