class Ad < ApplicationRecord
  belongs_to :colaborator
  has_many :questions, dependent: :destroy
  has_one :deal, dependent: :destroy
  validates :name, :category, :cost, presence: true
  has_one_attached :photo
  has_one_attached :album
  enum status: {available:0, disab:1, sold:2}
  enum category: {fashion_acc:0, cosmetic:1, eletrical_app:2, home_deco:3, tel_cel:4,
                book:5, sport:6, technology:7, other:8}

           #Ad.categories[ad.category] retorna integer     
  def cat_prod(i) 
    cat = ['Moda e acessórios', 'Cosméticos', 'Eletrodomésticos', 'Casa e decoração',
              'Telefones e celulares','Livros, artigos, revistas', 'Lazer e esportes',
              'Tecnologia', 'Outros']   
              cat[i]
  end      
end
