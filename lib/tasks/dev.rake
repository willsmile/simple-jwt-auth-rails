namespace :dev do
  desc "Seed data for development"
  task seeds: :environment do
    p '==================== create data for users ===================='
    user1 = User.create!(login_id: 'user1', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(login_id: 'user2', password: 'test123', password_confirmation: 'test123')
    user3 = User.create!(login_id: 'user3', password: 'test123', password_confirmation: 'test123')

  desc "Clean seed data for development"
  task clean: :environment do
    User.delete_all
  end
end
