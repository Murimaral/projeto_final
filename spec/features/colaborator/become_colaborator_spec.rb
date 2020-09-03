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
    scenario 'but form is blank' do
       #arrange
         #arrange
        company_a = Company.create!(name: 'Alpha', 
                 cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
        company_b = Company.create!(name: 'Beta', 
                                cnpj: '24.480.483/5611-63', domain: '@beta.com' )
       login_user()

       #act
       visit root_path
       click_on 'Preencha aqui seus dados e navegue sem restrições!'
       fill_in 'Nome completo', with: ''
       fill_in 'Nome social', with: ''
       fill_in 'Data de nascimento', with: ''
       fill_in 'CPF', with: ''
       fill_in 'Endereço', with: ''
       fill_in 'Cargo atual', with: ''
       click_on 'Completar meu cadastro e zarpar!'
       #assert
       expect(page).to have_content('Nome não pode ficar em branco')
       expect(page).to have_content('Nome social não pode ficar em branco')
       expect(page).to have_content('Data de nascimento não pode ficar em branco')
       expect(page).to have_content('CPF não pode ficar em branco')
       expect(page).to have_content('Endereço não pode ficar em branco')
       expect(page).to have_content('Cargo atual não pode ficar em branco')
    end
    scenario 'CPF not valid' do
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
        fill_in 'CPF', with: '89237497278'
        fill_in 'Endereço', with: 'Rua Urumajo'
        fill_in 'Cargo atual', with: 'Guarda'
        click_on 'Completar meu cadastro e zarpar!'

        #assert

        expect(page).to have_content('CPF inválido')
    end 


end


