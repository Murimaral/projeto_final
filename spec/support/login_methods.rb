def login_user()

user = User.create!( email: 'colaborador@alpha.com',
        password: '12345678')

        login_as user, scope: :user

        puts "colaborador@alpha.com"
        puts "12345678"

end

def login_admin()

admin = User.create!( email: 'admin@admin.com',
        password: '12345678', permission: 2)

        login_as admin, scope: :user

        puts "admin@admin.com"
        puts "12345678"
end

