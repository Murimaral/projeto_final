require 'rails_helper'

feature 'Buyer wants to buy a product' do

    scenario 'and send a deal proposal to ad owner' do


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
        click_on 'Quero comprar esse produto'
        fill_in 'Digite o local de entrega', with: 'Rua Aurora 45'
        click_on 'Solicitar acordo'

        #byebug
        expect(page).to have_content 'Aparador'
        expect(page).to have_content 'Solicitação enviada ao vendedor'
        expect(page).not_to have_content 'Quero comprar esse produto'
        


      end 
      scenario 'seller send the final price calculated to buyer' do


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
                            #description: 'Bom pra aparar', cost: 50, 
                            #colaborator: colabo_c)
        
        
        
        deal = Deal.create!(ad: ad_a, colaborator: colabo_c, address: 'Rua Aurora 45')

        #act
        visit root_path
        click_on 'Velejar pelas ofertas'

        click_on 'Mais detalhes'
        click_on 'Solicitação de Chuva'
        fill_in 'Desconto', with: 5
        fill_in 'Valor de frete', with: 30
        click_on 'Enviar boleto'

        #byebug
        expect(page).to have_content 'Escrivaninha'
        expect(page).to have_content 'R$ 75,00'
        expect(page).to have_content 'Colmeia'
        expect(page).to have_content 'Chuva'
        expect(page).to have_content 'Boleto enviado, aguarde aceite do comprador'
        
         

      end 
      scenario 'buyer finalizes the purchase' do


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
         #                   description: 'Velha porem boa', cost: 50, 
          #                  colaborator: colabo)

        ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                                 description: 'de Acaju', cost: 110, 
                                  colaborator: colabo_b)

        ad_c = Ad.create!(name: 'Aparador', category: 'sala',
                            description: 'Bom pra aparar', cost: 50, 
                            colaborator: colabo_c)
        deal = Deal.create!(ad: ad_c, colaborator: colabo, address: 'Rua Aurora 45', freight: 30, discount:5)
  
        #act
        visit root_path
        click_on 'Velejar pelas ofertas'
        click_on 'Mais detalhes'
        click_on 'Proposta de acordo'
        click_on 'Aceitar e continuar para o pagamento'
        click_on 'Finalizar e voltar para anúncios'

        #byebug
        expect(page).not_to have_content 'Aparador'
        

      end 
    end 
