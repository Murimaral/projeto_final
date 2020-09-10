# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.0

* Gems adicionais utilizadas: 
gem 'rspec-rails', '~> 4.0.1'
gem 'capybara'
gem 'devise'
gem 'cpf_cnpj'

* Como utilizar a aplicação:
## A aplicação consiste em um Market-place ('SealTheDeal'), em que internamente funcionarios de uma mesma empresa podem anunciar, vender e comprar produtos. 
## Há 3 tipos de usuarios, o admin, o colaborador e o visitante. O admin pode adicionar e remover empresas cadastradas no site (nome, cnpj, dominio de email). Apenas emails com dominio de uma empresa previamente cadastrada poderao criar conta como novos usuarios (match com regex).
## Ao conseguir criar conta, o usuario é do tipo visitante e tem uso restrito na aplicação. 
## Quando o visitante preenche os dados com informaçao completa (nome, nome social, data de nasc, endereço, departamento, cargo, cpf, este ultimo sendo validado pela gem), ele passa a ser colaborador. E pode usar a aplicação por completo, podendo pesquisar anuncios, comprar e vender.
## Um colaborador por possuir varios anuncios e pode acessá-los diretamente em MEUS ANUNCIOS. 
## Um comprador, pode interagir com o anuncio fazendo perguntas(o vendedor responde e essa troca de info fica registrada no FAQ do produto). O comprador pode pedir a compra do produto(adicionando o local do endereço de entrega), assim o vendedor ao acessar seu anuncio vê a proposta pendente e adiciona os devidos descontos e acrescimos de frete e envia o boleto ao comprador. O comprador assim decide se aceita ou cancela o acordo.
## Ao finalizar o acordo, aceitar o pagamento, (SealTheDeal), o anuncio entre em status de vendido e fica desabilitado permanentemente.
## o vendedor pode escolher por desabilitar e habilitar seu anuncio quando quiser, basta clicar nos links indicados no proprio anuncio.
## é possivel navegar pelos colaboradores cadastrados (apenas da mesma empresa), e ao clicar para abris os perfis, apenas informaçoes como nome social, contato (email), departamento, cargo podem ser vistos. 
## em todas as paginas é possivel dar logout da aplicação ou visitar sua propria pagina de perfil em MEU PERFIL.   
