# As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.

# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")

require 'rails_helper'

RSpec.describe "Student Show page" do
  describe "As a visitor" do
    describe "When I visit '/students/:id'" do
      it "I see a list of the students' courses" do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        defense = Course.create!(name: "Defense against the Dark Arts")
        herbology = Course.create!(name: "Herbology")
        potions = Course.create!(name: "Potions")

        StudentCourse.create!(student: student, course: defense)
        StudentCourse.create!(student: student, course: herbology)
        StudentCourse.create!(student: student, course: potions)

        visit "/students/#{student.id}"
        # save_and_open_page
        expect(page).to have_content("Defense against the Dark Arts")
        expect(page).to have_content("Herbology")
        expect(page).to have_content("Potions")

      end
    end
  end
end
