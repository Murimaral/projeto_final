def login_user()

user = User.create!( email: 'colaborador@alpha.com',
        password: '12345678')

        login_as user, scope: :user

      

end

def login_admin()

admin = User.create!( email: 'admin@admin.com',
        password: '12345678', permission: :admin)

        login_as admin, scope: :user

end

