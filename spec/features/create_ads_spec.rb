require 'rails_helper'

feature 'Registered user creates an ad' do

    scenario 'successfully' do

        #arrange
        company_a = Company.create!(name: 'Alpha', 
                         cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
        company_b = Company.create!(name: 'Beta', 
        cnpj: '24.480.483/5611-63', domain: '@beta.com' )
                        

        user = User.create!( email: 'colaborador@alpha.com',
        password: '12345678')

       
        login_as user, scope: :user
        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                    company: company_a, user: user)
                                

        colabo.user.colab!
        #act
        
        visit root_path
        
        click_on 'Velejar pelas ofertas'
        click_on 'Criar novo anúncio'
        fill_in 'Nome do produto',with: 'Escrivaninha'
        fill_in 'Categoria',with: 'escritório'
        fill_in 'Informações do produto',with: 'Escrivaninha velha porem boa, aceito pagamento em VR'    
        fill_in 'Preço', with: 200.00
        click_on 'Anunciar'
        
        #byebug
        #assert
        expect(page).to have_content('Escrivaninha')
        expect(page).to have_content('escritório')
        expect(page).to have_content('Escrivaninha velha porem boa, aceito pagamento em VR')
        expect(page).to have_content('R$ 200,00')
        expect(page).to have_content('Anúncio feito com sucesso!')
        expect(page).to have_link('Continuar navegando')



        
    end 
    
end 


