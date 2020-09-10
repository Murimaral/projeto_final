# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

colabo_b = Colaborator.create!(name: 'Guarda Belo', social_name: 'Belo', birth_date: '23/10/1990',
                        cpf: '76094363213', section: 'Vendas', address: 'Rua Icarai', role: 'Guarda Florestal', 
                        company: company_b, user: user_b)

colabo = Colaborator.create!(name: 'Ze Colmeia', social_name: 'Colmeia', birth_date: '13/10/1990',
                    cpf: '39947989810', section: 'Vendas',address: 'Rua Urumajo', role: 'Guardinha', 
                    company: company_a, user: user)

colabo_c = Colaborator.create!(name: 'Mandachuva', social_name: 'Chuva', birth_date: '03/10/1990',
                        cpf: '81240267770',section: 'RH', address: 'Rua Celso', role: 'Gerente de compras', 
                        company: company_a, user: user_c)     
colabo_d = Colaborator.create!(name: 'Sir Lancelot', social_name: 'Lancelot', birth_date: '03/10/1990',
                        cpf: '19263609829', section: 'RH',address: 'Rua James', role: 'Profissao Atrapalhar Teste', 
                        company: company_a, user: user_d)

    ad_a = Ad.create!(name: 'Escrivaninha', category: 'escritorio',
                            description: 'Velha porem boa', cost: 50, 
                            colaborator: colabo)

    ad_b = Ad.create!(name: 'Movel Colonial', category: 'lar',
                             description: 'de Acaju', cost: 110, 
                              colaborator: colabo_b)

    ad_c = Ad.create!(name: 'Aparador', category: 'lar',
                        description: 'Ta em otimas condiçoes', cost: 50, 
                        colaborator: colabo_c)

    deal = Deal.create!(ad: ad_a, colaborator: colabo_c, address: 'Rua Aurora 45')