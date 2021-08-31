namespace :dev do

  DEFAULT_PASSWORD = 'olamundo123456'

  desc "Configure the development enviroment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop BD...") {%x(rails db:drop)}
      show_spinner("Create BD...") {%x(rails db:create)}
      show_spinner("Migrate BD...") {%x(rails db:migrate)}
      show_spinner("Add default admin") {%x(rails dev:add_default_admin)}
      show_spinner("Add others admins") {%x(rails dev:add_others_admins)}
      show_spinner("Add default user") {%x(rails dev:add_default_user)}
    else
      puts "You are not in the development enviroment"
    end
  end

  desc "Add default admin"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Add others admins"
  task add_others_admins: :environment do 
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = "٩(˘◡˘)۶!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin 
    yield
    spinner.success("(#{msg_end})")
  end

end
