require 'rails_helper'

feature 'Seller accept proposal and seals the deal' do

    scenario 'and send a final offer' do


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
        
        negociation = Negociation.create!(ad: ad_a, 
                                        colaborator: colabo_c, ask: 'quanto sai essa brincadeira ai')
        
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'

        click_on 'Responder proposta de Chuva'
        click_on 'Oferta final de negociação'
        fill_in 'Valor de oferta', with: 45
        click_on 'Enviar oferta final'

        #byebug
        expect(page).to have_content 'Escrivaninha'
        expect(page).to have_content 'Rua Celso'
        expect(page).to have_content 'Chuva'
        expect(page).to have_content 'Colmeia'
        expect(page).to have_content 'R$ 45,00'


      end 
      scenario 'buyer accepts and specify the pay methods' do


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
        
        negociation = Negociation.create!(ad: ad_c, 
                                        colaborator: colabo, ask: 'quanto sai essa brincadeira ai')
        
        deal = Deal.create!(ad: ad_c, colaborator: colabo, final_price: 100)

        #act
        visit root_path
        click_on 'Velejar pelas ofertas'

        click_on 'Mais detalhes'
        click_on 'Ver negociação'
        click_on 'Chuva gostaria de fechar um acordo com você'
        click_on 'Trato feito, vamos aos métodos de pagamento'
        
        choose.page 'Entregar para outro endereço'
        choose('Boleto')
        click_on 'Selar o trato'

        #byebug
        expect(page).to have_content 'Aparador'
        expect(page).to have_content 'de Acaju'

        expect(page).to have_content 'R$ 100,00'
        expect(page).to have_content 'Colmeia'
        expect(page).to have_link 'Trato feito! Assim que for confirmado o pagamento, o envio será realizado'


      end 
    end 
