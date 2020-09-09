require 'rails_helper'

feature 'Ad owner disables his ad' do
    scenario 'successfully' do
       #arrange
       company_a = Company.create!(name: 'Alpha', 
       cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
       
       company_b = Company.create!(name: 'Beta', 
               cnpj: '24.480.483/5611-63', domain: '@beta.com' )


       user = User.create!( email: 'colaborador@alpha.com',
                   password: '12345678', permission: :colab)

       user_b = User.create!( email: 'colaborador@beta.com',
                           password: '12345655', permission: :colab)

       user_c = User.create!( email: 'colaboradorc@alpha.com',
                           password: '12345777', permission: :colab)


       login_as user, scope: :user

       colabo_b = Colaborator.create!(name: 'Guarda Belo', social_name: 'Belo', birth_date: '23/10/1990',
                                       cpf: '76094363213', address: 'Rua Icarai', role: 'Guarda Florestal', 
                                       company: company_b, user: user_b)

       colabo_a = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                   cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                   company: company_a, user: user)

       colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                       cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
                                       company: company_a, user: user_c)                            

       ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
                           description: 'Velha porem boa', cost: 50, 
                           colaborator: colabo_a)

       ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                                description: 'de Acaju', cost: 110, 
                                 colaborator: colabo_b)

       #ad_c = Ad.create!(name: 'Aparador', category: 'sala',
                          # description: 'Bom pra aparar', cost: 50, 
                           #colaborator: colabo_c)
       
       #act
       visit root_path
       click_on 'Velejar pelas ofertas'
       click_on 'Desativar temporariamente'     
       
       #assert
       expect(page).not_to have_content 'Escrivaninha'
       expect(page).not_to have_content 'escritorio'
       
    end
    scenario 'successfully' do
        #arrange
        company_a = Company.create!(name: 'Alpha', 
        cnpj: '63.297.410/6617-31', domain: '@alpha.com' )
        
        company_b = Company.create!(name: 'Beta', 
                cnpj: '24.480.483/5611-63', domain: '@beta.com' )
 
 
        user = User.create!( email: 'colaborador@alpha.com',
                    password: '12345678', permission: :colab)
 
        user_b = User.create!( email: 'colaborador@beta.com',
                            password: '12345655', permission: :colab)
 
        user_c = User.create!( email: 'colaboradorc@alpha.com',
                            password: '12345777', permission: :colab)
 
 
        login_as user, scope: :user
 
        colabo_b = Colaborator.create!(name: 'Guarda Belo', social_name: 'Belo', birth_date: '23/10/1990',
                                        cpf: '76094363213', address: 'Rua Icarai', role: 'Guarda Florestal', 
                                        company: company_b, user: user_b)
 
        colabo_a = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                    company: company_a, user: user)
 
        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
                                        company: company_a, user: user_c)                            
 
        ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
                            description: 'Velha porem boa', cost: 50, 
                            colaborator: colabo_a, status: :disab)
 
        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                                 description: 'de Acaju', cost: 110, 
                                  colaborator: colabo_b)
 
        #ad_c = Ad.create!(name: 'Aparador', category: 'sala',
                           # description: 'Bom pra aparar', cost: 50, 
                            #colaborator: colabo_c)
        
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        click_on 'Meus anúncios' 
        click_on 'Habilitar anúncio'
       
        #assert
        expect(page).to have_content 'Escrivaninha'
        expect(page).to have_content 'escritorio'
        expect(page).to have_content 'Desativar temporariamente'
        expect(page).not_to have_content 'Habilitar anúncio'
    end 
end