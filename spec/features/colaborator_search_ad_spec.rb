require 'rails_helper'

feature 'search ads by key words' do
    scenario 'by ads title' do

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
                                        cpf: '76094363213', address: 'Rua Icarai', section: 'Segurança', role: 'Guarda Florestal', 
                                        company: company_b, user: user_b)

        colabo_a = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', section: 'Vendas', role: 'Guardinha', 
                                    company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', section: 'Recursos humanos', role: 'Andarilho', 
                                        company: company_a, user: user_c) 
        
        
        ad_a = Ad.create!(name: 'Escrivaninha', category: :home_deco,
                                description: 'Velha porem boa', cost: 50, 
                                colaborator: colabo_a)
                            
        ad_b = Ad.create!(name: 'Movel Colonial', category: :home_deco,
                                    description: 'de Acaju', cost: 110, 
                                    colaborator: colabo_b)
    
        ad_c = Ad.create!(name: 'Aparador', category: :home_deco,
                             description: 'Bom pra aparar', cost: 50, 
                            colaborator: colabo_c)     
                            
        ad_aaa = Ad.create!(name: 'Aparelho MP3', category: :technology,
                             description: 'Pouco uso, 200W', cost: 350, 
                            colaborator: colabo_a) 

        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        fill_in 'Insira o título do anúncio', with: 'Escrivaninha'
        click_on 'Buscar por título'

        #assert
        expect(page).to have_content 'Escrivaninha'
        expect(page).not_to have_content 'Aparador'
        expect(page).not_to have_content 'Aparelho MP3'
        expect(page).not_to have_content 'Movel Colonial'

      
    end

    scenario 'by selecting category' do

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
                                        cpf: '76094363213', address: 'Rua Icarai', section: 'Segurança', role: 'Guarda Florestal', 
                                        company: company_b, user: user_b)

        colabo_a = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', section: 'Vendas', role: 'Guardinha', 
                                    company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', section: 'Recursos humanos', role: 'Andarilho', 
                                        company: company_a, user: user_c) 
        
        
        ad_a = Ad.create!(name: 'Escrivaninha', category: :home_deco,
                                description: 'Velha porem boa', cost: 50, 
                                colaborator: colabo_a)
                            
        ad_b = Ad.create!(name: 'Movel Colonial', category: :home_deco,
                                    description: 'de Acaju', cost: 110, 
                                    colaborator: colabo_b)
    
        ad_c = Ad.create!(name: 'Aparador', category: :home_deco,
                             description: 'Bom pra aparar', cost: 50, 
                            colaborator: colabo_c)     
                            
        ad_aaa = Ad.create!(name: 'Aparelho MP3', category: :technology,
                             description: 'Pouco uso, 200W', cost: 350, 
                            colaborator: colabo_a) 

        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        choose 'Casa e decoração'
        click_on 'Filtrar por categoria'

        #assert
        expect(page).to have_content 'Escrivaninha'
        expect(page).to have_content 'Aparador'
        expect(page).not_to have_content 'Aparelho MP3'
        expect(page).not_to have_content 'Movel Colonial'

      
    end

end


