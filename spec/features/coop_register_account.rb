require 'rails_helper'

feature 'Coop register new account' do
    scenario 'successfully' do
        #arrange
        
        #act
        visit root_path
        click_on 'Fazer login'
        click_on 'Cadastrar'
        fill_in 'E-mail', with: 'user@company.com'
        fill_in 'Senha', with: '12345678'
        fill_in 'Confirme sua senha', with: '12345678'
        click_on 'Enviar'
        
        
        #assert
        expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso')
        expect(page).to have_link('Fazer login')


    end
end
