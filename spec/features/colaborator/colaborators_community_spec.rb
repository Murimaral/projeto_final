require 'rails_helper'

feature 'search for colabs' do
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
                                        cpf: '76094363213', address: 'Rua Icarai', section: 'Segurança', role: 'Guarda Florestal', 
                                        company: company_b, user: user_b)

        colabo_a = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                                    cpf: '39947989810', address: 'Rua Urumajo', section: 'Vendas', role: 'Guardinha', 
                                    company: company_a, user: user)

        colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                                        cpf: '81240267770', address: 'Rua Celso', section: 'Recursos humanos', role: 'Andarilho', 
                                        company: company_a, user: user_c) 

        #act
        visit root_path
        click_on 'Comunidade à bordo'
        fill_in 'Nome', with: 'Chuva'
        fill_in 'Cargo', with: 'iufhdeiueh'
        click_on 'Buscar por nome'
        
        #assert
        expect(page).to have_content('Chuva')
        expect(page).to have_content('Andarilho')
        expect(page).to have_content('Recursos humanos')
        expect(page).not_to have_content('Guarda Belo')
        expect(page).not_to have_content('Ze Colmeia')

    end
    scenario 'of a different company' do

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

        #act
        visit root_path
        click_on 'Comunidade à bordo'
        fill_in 'Departamento', with: 'Segurança'
        click_on 'Buscar por departamento'
        
        #assert
        expect(page).not_to have_content('Chuva')
        expect(page).not_to have_content('Guarda Belo')
        expect(page).not_to have_content('Ze Colmeia')

    end
    scenario 'and check someones profile' do

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

        
        #act
        visit root_path
        click_on 'Comunidade à bordo'
        fill_in 'Nome', with: 'Chuva'
        fill_in 'Departamento', with: 'Vendas'
        fill_in 'Cargo', with: 'iufhdeiueh'
        click_on 'Buscar por departamento'     
        click_on 'Ver perfil'
        
        #assert
        expect(page).to have_content('Rua Urumajo')
        expect(page).to have_content('Colmeia')
        expect(page).to have_content('13/10/1990')  
        
    end
    scenario 'of a different company' do

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

        #act
        visit root_path
        click_on 'Comunidade à bordo'
        fill_in 'Departamento', with: 'Segurança'
        click_on 'Buscar por departamento'
        
        #assert
        expect(page).not_to have_content('Chuva')
        expect(page).not_to have_content('Guarda Belo')
        expect(page).not_to have_content('Ze Colmeia')

    end
    scenario 'and his own profile' do

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

        
        #act
        visit root_path
        click_on 'Comunidade à bordo'
        fill_in 'Nome', with: 'Chuva'
        fill_in 'Departamento', with: 'Vendas'
        fill_in 'Cargo', with: 'iufhdeiueh'
        click_on 'Buscar por departamento'     
        click_on 'Ver perfil'
        click_on 'Editar perfil'
        fill_in 'Endereço', with: 'Rua Aldeia Paracanti'
        click_on 'Atualizar meu cadastro'

        
        #assert
        expect(page).not_to have_content('Rua Urumajo')
        expect(page).to have_content('Rua Aldeia Paracanti')
        expect(page).to have_content('Colmeia')
        expect(page).to have_content('13/10/1990')  
        
    end

end

