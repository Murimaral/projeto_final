class DealsController < ApplicationController
    before_action :set_colab, only: [:new, :create]
    before_action :authorization_and_params
    
   def new 
    @deal = Deal.new
   end
   def create 
    @deal = Deal.new(params.require(:deal).permit(:address).merge(colaborator: @colaborator, ad: @ad))
    if @deal.save!
        redirect_to ads_path, notice: 'Solicitação enviada ao vendedor'
    else
        redirect_to @ad, notice: 'Houve algum erro inesperado'
    end
   end
   def edit
    @deal = Deal.find(params[:id])
   end 
   def update
    @deal = Deal.find(params[:id])
    if @deal.update!(params.require(:deal).permit(:discount, :freight))
        redirect_to ad_deal_path(@ad,@deal), notice: 'Boleto enviado, aguarde aceite do comprador'
    else
        redirect_to @ad, notice: 'Houve algum erro inesperado'
    end
   end
   def show
      @deal = Deal.find(params[:id])
   end
   def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to ad_path(@ad), notice: 'Acordo cancelado'
   end


private

    def authorization_and_params

        if Ad.find(params[:ad_id]).nil?
            redirect_to root_path, notice: 'Houve algum erro'
        else
            @ad = Ad.find(params[:ad_id])
        end
    end
    def set_colab
        @colaborator = current_user.colaborator
    end 
end 
