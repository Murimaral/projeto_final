class DealsController < ApplicationController
   before_action :authorization_and_params
    
   def new
    @deal = Deal.new
   end
   def create
    @deal = Deal.new(params.require(:deal).permit(:final_price).merge(colaborator: @colaborator, ad: @ad))
    @deal.save!
    redirect_to ad_negociation_deal_path(@ad, @negociation, @deal), notice: 'Oferta final enviada, aguarde o aceite do comprador'    
   end
   def show
    @deal = Deal.find(params[:id])
   end

private

def authorization_and_params
    if Ad.find(params[:ad_id]).nil?
        redirect_to root_path, notice: 'Houve algum erro'
    else
        @ad = Ad.find(params[:ad_id])
        @negociation = Negociation.find(params[:negociation_id])
        @colaborator = @negociation.colaborator
        if @ad.negociations.where(colaborator: @colaborator).nil?
            redirect_to root_path, notice: 'Acesso negado'
        end 
    end
end

end 
