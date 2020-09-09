require 'rails_helper'

feature 'Buyer send a proposal to seller' do
      xscenario 'successfully' do


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

        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
        cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
        company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
        cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
        company: company_a, user: user_c)                            

        #ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
        #description: 'Velha porem boa', cost: 50, 
        #colaborator: colabo)

        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
        description: 'de Acaju', cost: 110, 
        colaborator: colabo_b)

        ad_c = Ad.create!(name: 'Aparador', category: 'sala',
        description: 'Bom pra aparar', cost: 50, 
        colaborator: colabo_c)

        
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        click_on 'Mais detalhes'
        click_on 'Quero negociar este produto'
        fill_in 'Mensagem', with: 'te dou 40 e nao se fala mais nisso'
        click_on 'Enviar'

        expect(page).to have_content 'Mensagem enviada'
        expect(page).not_to have_content 'Quero comprar esse produto'
        expect(page).to have_content 'Enviar mensagem'

      end 
      
      xscenario 'and buyer check if there is any reply' do


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

        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
        cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
        company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
        cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
        company: company_a, user: user_c)                            

        #ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
        #description: 'Velha porem boa', cost: 50, 
        #colaborator: colabo)

        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
        description: 'de Acaju', cost: 110, 
        colaborator: colabo_b)

        ad_c = Ad.create!(name: 'Aparador', category: 'sala',
        description: 'Bom pra aparar', cost: 50, 
        colaborator: colabo_c)
        
        negociation = Negociation.create!(ad: ad_c, colaborator: colabo, ask: 'quanto sai essa brincadeira ai')
        
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        click_on 'Mais detalhes'
        click_on 'Ver negociação'
        
        #assert
        expect(page).to have_content 'quanto sai essa brincadeira ai'
        expect(page).to have_content 'Colmeia'
        expect(page).to have_content 'Enviar mensagem'

      end 

      xscenario 'and seller answer with new price' do


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

        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                    company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
                                        company: company_a, user: user_c)                            

        ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
                            description: 'Velha porem boa', cost: 50, 
                            colaborator: colabo)

        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                                 description: 'de Acaju', cost: 110, 
                                  colaborator: colabo_b)

        #ad_c = Ad.create!(name: 'Aparador', category: 'sala',
                           # description: 'Bom pra aparar', cost: 50, 
                            #colaborator: colabo_c)
        
        
        
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'

        click_on 'Ver negociação com Chuva'
        #byebug
        click_on 'Enviar mensagem'
        fill_in 'Mensagem', with: 'ta bom faço por 40'
        click_on 'Enviar'

        expect(page).to have_content 'Mensagem enviada'
        expect(page).to have_content 'ta bom faço por 40'
        expect(page).to have_content 'quanto sai essa brincadeira ai'


      end 
      
     xscenario 'without seeing negociations of diferent colabs' do


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

        user_d = User.create!( email: 'colaboradord@alpha.com',
                            password: '12345999', permission: :colab)
        login_as user, scope: :user

        colabo_b = Colaborator.create!(name: 'Guarda Belo', social_name: 'Belo', birth_date: '23/10/1990',
                                        cpf: '76094363213', address: 'Rua Icarai', role: 'Guarda Florestal', 
                                        company: company_b, user: user_b)

        colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', role: 'Guardinha', 
                                    company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', role: 'Andarilho', 
                                        company: company_a, user: user_c)     
        colabo_d = Colaborator.create!(name: 'Sir Lancelot', social_name: 'Lancelot', birth_date: '03/10/1990',
                                        cpf: '19263609829', address: 'Rua James', role: 'Atrapalhador de testes', 
                                        company: company_a, user: user_d)                                                             

        ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
                            description: 'Velha porem boa', cost: 50, 
                            colaborator: colabo)

        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                                 description: 'de Acaju', cost: 110, 
                                  colaborator: colabo_b)

        #ad_c = Ad.create!(name: 'Aparador', category: 'sala',
                           # description: 'Bom pra aparar', cost: 50, 
                            #colaborator: colabo_c)
        
        negociation = Negociation.create!(ad: ad_a, 
                                        colaborator: colabo_c, ask: 'quanto sai essa brincadeira ai')
        
        negociation_not_to_be_seen = Negociation.create!(ad: ad_a, 
                                        colaborator: colabo_d, ask: 'nao devo aparecer')                                        


        #act
        visit root_path
        click_on 'Velejar pelas ofertas'

        click_on 'Ver negociação com Chuva'
        
        expect(page).to have_content 'quanto sai essa brincadeira ai'
        expect(page).not_to have_content 'nao devo aparecer'

      end 




    end
