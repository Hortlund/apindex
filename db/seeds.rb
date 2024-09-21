# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'

# Define constants for gender options to ensure consistency
GENDER_OPTIONS = ['Male', 'Female', 'Other']

# Number of records to seed
NUMBER_OF_SUBMISSIONS = 1000

# Clear existing submissions
Submission.delete_all

puts "Deleted all existing submissions."

# Seed submissions
NUMBER_OF_SUBMISSIONS.times do |i|
  submission = Submission.new(
    name: Faker::Name.name,
    height: Faker::Number.between(from: 140, to: 200),       # Height in cm
    arm_length: Faker::Number.between(from: 50, to: 100),   # Arm length in cm
    age: Faker::Number.between(from: 18, to: 80),           # Age in years
    gender: GENDER_OPTIONS.sample
  )

  # If difference is a stored attribute, assign it here
  # submission.difference = submission.height - submission.arm_length

  if submission.save
    puts "Created Submission #{i + 1}: #{submission.name}"
  else
    puts "Failed to create Submission #{i + 1}: #{submission.errors.full_messages.join(', ')}"
  end
end

puts "Successfully seeded #{NUMBER_OF_SUBMISSIONS} submissions."
