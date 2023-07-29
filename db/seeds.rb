require 'faker'
puts "deleting old data..."
User.destroy_all
Prescription.destroy_all
Comment.destroy_all
Reminder.destroy_all


puts "🌱 Seeding spices..."
puts "Creating users..."
5.times do
    user = User.create(
        name: Faker::Name.name,
        email_address: Faker::Internet.email,
        password: "password"
    )
end

puts "creating prescriptions..."

13.times do
    user = User.order('RANDOM()').first

    prescription = Prescription.create(
        name: ["Tramadol","OxyContin","Celecoxib","Amoxicillin","Levofloxacin","Metformin","Esomeprazole","Bupropion","Sertraline","Celebrex","Tapentadol","Synthroid","Lipitor"].sample,
        dosage: ["once","twice","thrice"].sample,
        duration: [5,7,10,14,30].sample,
        instructions: Faker::Lorem.sentence,
        user_id: user.id
    )

    rand(1..3).times do
        Comment.create(
            comment: Faker::Lorem.sentence,
            prescription_id: prescription.id
        )
    end

    rand(1..3).times do
        Reminder.create(
            message: Faker::Lorem.sentence,
            prescription_id: rand(1..13)
        )
    end
end

puts "creating comments..."


puts "creating reminders..."






# Seed your database here

puts "✅ Done seeding!"
