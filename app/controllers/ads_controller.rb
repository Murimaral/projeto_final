class AdsController < ApplicationController
    before_action :authentic_colab?
   
   def index
      @ads = Ad.all
   end
   
    def new
      @ad = Ad.new
   end
   def create
      @colaborator = current_user.colaborator
      @ad = Ad.new(ad_params)
      if @ad.save!
        redirect_to @ad, notice: 'Anúncio feito com sucesso!'
      end
   end
   def show
      @ad = Ad.find(params[:id])
   end


private
def ad_params
    params.require(:ad).permit(:name, :category,
    :description, :cost).merge(colaborator_id: @colaborator.id)

end
def authentic_colab?
    if current_user.visitor?
        fail('Você não tem permissão de acesso')
    end
end
            

end