require 'rails_helper'

feature 'Admin register new company' do
    scenario 'successfully' do

     #arrange
     login_admin()
     #act
     visit root_path
     click_on 'Ver empresas parceiras'
     click_on 'Cadastrar nova empresa'
     fill_in 'Nome da empresa', with: 'Alpha'
     #find_field('Nome da empresa').set('Alpha')
     fill_in 'nº do CNPJ', with: '63.297.410/6617-31'
     fill_in 'Domínio do email', with: '@alpha.com'
     click_on 'Finalizar Cadastro'
     #assert
     expect(page).to have_content('Alpha')
     expect(page).to have_content('63.297.410/6617-31')
     expect(page).to have_content('@alpha.com')
     expect(page).to have_content('Cadastro realizado com sucesso!')

     
    end

    scenario 'with blank fields' do
    
    #arrange
    login_admin()

    #act
    visit root_path
    click_on 'Ver empresas parceiras'
    click_on 'Cadastrar nova empresa'
    fill_in 'Nome da empresa', with: ''
    #find_field('Nome da empresa').set('Alpha')
    fill_in 'nº do CNPJ', with: ''
    fill_in 'Domínio do email', with: ''
    click_on 'Finalizar Cadastro'

    #assert
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Domínio não pode ficar em branco')
    end 

end