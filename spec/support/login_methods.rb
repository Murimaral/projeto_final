def login_user()

user = User.create!( email: 'lorem@ipsum.com',
        password: '12345678')

        login_as user, scope: :user

        puts "lorem@ipsum.com"
        puts "12345678"

end
