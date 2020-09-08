class DealsController < ApplicationController
   before_action :authorization_and_params
    
   def new
    
    @deal = Deal.new
   end
   def create
    @deal = Deal.new(params.require(:deal).permit(:final_price).merge(colaborator: @colaborator, ad: @ad))
    @deal.save!
    redirect_to onlyus_ad_negociation_path(@ad, @negociation), notice: 'Oferta final enviada, aguarde o aceite do comprador'    
   end
   def show
    @deal = Deal.find(params[:id])
   end
   def edit
    @deal = Deal.find(params[:id])
   end
   def update
    @deal = Deal.find(params[:id])
    if @deal.update!(params.require(:deal).permit(:pay_met, :deliver_diff_ad))
        @payment = Payment.create!(colaborator: @colaborator, ad: @ad, price: @deal.final_price)
        @ad.sold!
        if @deal.same_address?
            redirect_to ad_negociation_deal_payment_path(@ad, @negociation, @deal, @payment), notice: 'Trato feito! Assim que for confirmado o pagamento, o envio será realizado'  
        else
            redirect_to edit_ad_negociation_deal_payment_path(@ad, @negociation, @deal, @payment)
        end
    else
        redirect_to root_path, notice: 'Houve um erro inesperado'
    end   
   end
   def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to ad_negociations_path(@ad), notice: 'Acordo cancelado'
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
