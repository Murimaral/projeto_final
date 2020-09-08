class AdsController < ApplicationController
    before_action :authentic_colab?
    before_action :set_colab, only: [:index, :create, :update]
   def index
      @ads = Ad.where(colaborator: @company.colaborators, status: :available)
   end
   
   def new
      @ad = Ad.new
   end

   def create
      @ad = Ad.new(ad_params)
      if @ad.save
        redirect_to @ad, notice: 'Anúncio feito com sucesso!'
      else
         render :new  
      end
   end

   def show
      @ad = Ad.find(params[:id])
      @negociations = @ad.negociations.where(colaborator: current_user.colaborator)
   end

   def edit
      @ad = Ad.find(params[:id])
   end

   def update
      @ad = Ad.new(params.require(:ad).permit(:name, :category, 
                     :description, :cost).merge(colaborator: @colaborator))
      if @ad.save
         redirect_to @ad, notice: 'Alterações salvas com sucesso!'
      else
         render :edit                  
      end
   end

   def destroy
      @ad = Ad.find(params[:id])
      @ad.destroy
      redirect_to ads_path, notice: 'Anúncio apagado com sucesso!'
   end 
   
   def owned
      @colaborator = current_user.colaborator
      @ads = Ad.where(colaborator: @colaborator)
      render :index
   end


private
def ad_params
    params.require(:ad).permit(:name, :category,
    :description, :cost).merge(colaborator_id: @colaborator.id)

end
def authentic_colab?
    if current_user.visitor?
        redirect_to root_path, alert: 'Você não tem permissão de acesso'
    end
end
def set_colab
   @company = current_user.colaborator.company
   @colaborator = current_user.colaborator
end
            

end