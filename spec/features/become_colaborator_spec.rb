require 'rails_helper'

feature 'user complete his register' do
    scenario 'and become a colaborator' do
        #arrange
        company_a = Company.create!(name: 'Alpha', 
                         cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
        company_b = Company.create!(name: 'Beta', 
        cnpj: '24.480.483/5611-63', domain: '@beta.com' )
                        

        login_user() 

        #act
        visit root_path
        click_on 'Preencha aqui seus dados e navegue sem restrições!'
        fill_in 'Nome completo', with: 'Zé Colmeia'
        fill_in 'Nome social', with: 'Colmeia'
        fill_in 'Data de nascimento', with: '13/10/1990'
        fill_in 'CPF', with: '399.479.898-10'
        fill_in 'Endereço', with: 'Rua Urumajo'
        fill_in 'Cargo atual', with: 'Guarda'
        click_on 'Completar meu cadastro e zarpar!'

        #assert
        expect(page).to have_content('Ahoy! Seja Bem-vindo(a) à bordo, Colmeia')
        expect(page).to have_link('Sair')
    end
end


