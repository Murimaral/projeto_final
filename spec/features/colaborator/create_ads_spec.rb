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
        choose 'Casa e decoração'
        fill_in 'Informações do produto',with: 'Escrivaninha velha porem boa, aceito pagamento em VR'    
        fill_in 'Preço', with: 200.00
        click_on 'Anunciar'
        
        #byebug
        #assert
        expect(page).to have_content('Escrivaninha')
        expect(page).to have_content('Casa e decoração')
        expect(page).to have_content('Escrivaninha velha porem boa, aceito pagamento em VR')
        expect(page).to have_content('R$ 200,00')
        expect(page).to have_content('Anúncio feito com sucesso!')
        expect(page).to have_link('Continuar navegando')

        

        
    end 

    scenario 'but important fields are missing' do

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
        fill_in 'Nome do produto',with: ''
        fill_in 'Informações do produto',with: 'Escrivaninha velha porem boa, aceito pagamento em VR'    
        fill_in 'Preço', with: ''
        click_on 'Anunciar'
        
        #byebug
        #assert
        expect(page).to have_content('Nome do produto não pode ficar em branco')
        expect(page).to have_content('Categoria não pode ficar em branco')
        expect(page).to have_content('Preço não pode ficar em branco')

        

        
    end 
    
    scenario 'and later make some changes' do

          #arrange
          company_a = Company.create!(name: 'Alpha', 
                         cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
        company_b = Company.create!(name: 'Beta', 
        cnpj: '24.480.483/5611-63', domain: '@beta.com' )
                        

        user = User.create!( email: 'colaborador@alpha.com',
        password: '12345678', permission: :colab)

       
        login_as user, scope: :user
        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                    company: company_a, user: user)

        ad = Ad.create!(name: 'Escrivaninha', category: :home_deco,
                        description: 'Velha porem boa', cost: 50, 
                        colaborator: colabo)
                        
       
        
        #act     
        visit ad_path(ad.id)
        click_on 'Editar anúncio'
        fill_in 'Nome do produto',with: 'Bola de volei 6.0'
        choose 'Lazer e esportes'
        fill_in 'Informações do produto',with: 'Bola oficial da Mikasa'    
        fill_in 'Preço', with: 100
        click_on 'Anunciar'

        #assert
        expect(page).to have_content('Bola de volei 6.0')
        expect(page).to have_content('Lazer e esportes')
        expect(page).to have_content('Bola oficial da Mikasa')
        expect(page).to have_content('R$ 100,00')
        expect(page).to have_content('Alterações salvas com sucesso!')
       
    end

    scenario 'and destroys it' do

      #arrange
      company_a = Company.create!(name: 'Alpha', 
                       cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
      company_b = Company.create!(name: 'Beta', 
      cnpj: '24.480.483/5611-63', domain: '@beta.com' )
                      

      user = User.create!( email: 'colaborador@alpha.com',
      password: '12345678', permission: :colab)

     
      login_as user, scope: :user
      colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                  cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                  company: company_a, user: user)

      ad = Ad.create!(name: 'Creme hidratante', category: :cosmetic,
                      description: 'Velha porem boa', cost: 50, 
                      colaborator: colabo)
                      
     
      
      #act     
      visit ad_path(ad.id)
      click_on 'Apagar anúncio'

      expect(current_path).to eq ads_path
      expect(page).to have_content 'Não há anúncios'

    end

    
end 


