require 'rails_helper'

feature 'user login' do
    scenario 'successfully' do
        #arrange
        user = User.create!(email: 'teste@teste.com', 
                            password: '12345678')
        #act
        visit root_path
        click_on 'Fazer login'
        fill_in 'E-mail', with: 'teste@teste.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Entrar'

        #assert
        expect(page).to have_link('Sair')
        expect(page).not_to have_content ('Fazer login')  

    end
    
    scenario 'and logout' do
        #arrange
        login_user()
        #act
        visit root_path
        click_on 'Sair'

        #assert
        expect(page).to have_link('Fazer login')
        expect(page).not_to have_link ('Sair')  
    end

        

end

