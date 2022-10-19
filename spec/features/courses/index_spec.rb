# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.

# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")
require "rails_helper"

RSpec.describe "Courses Index" do
  describe "As a visitor" do
    describe "When I visit '/courses'" do
      it "I see a list of courses and the number of students enrolled in each course" do
        student_1 = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        defense = Course.create!(name: "Defense against the Dark Arts")
        herbology = Course.create!(name: "Herbology")
        potions = Course.create!(name: "Potions")

        StudentCourse.create!(student: student_1, course: defense)
        StudentCourse.create!(student: student_1, course: herbology)
        StudentCourse.create!(student: student_1, course: potions)

        visit '/courses'
        #  save_and_open_page
        expect(page).to have_content(defense.students.count)
        expect(page).to have_content(herbology.students.count)
        expect(page).to have_content(potions.students.count)

      end
    end
  end
end

