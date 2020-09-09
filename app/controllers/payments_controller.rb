class PaymentsController < ApplicationController
   before_action :authentic_colab?
   before_action :set_params
    def create
        @payment = Payment.new(colaborator: @colaborator,deal: @deal,
                                                receipt: @deal.calculate_receipt(@ad.cost))
        if @payment.save!
            redirect_to ad_deal_payment_path(@ad,@deal,@payment), notice: 'aaand Seal the deal! Compra realizada com sucesso!'
            @ad.sold!
        else
            redirect_to ad_deal_path(@ad,@deal), notice: 'Houve algum erro inesperado'
        end
    end

    def show
        @payment = Payment.find(params[:id])
    end
   

    private
    def authentic_colab?
        if current_user.visitor?
            redirect_to root_path, alert: 'Você não tem permissão de acesso'
        end
    end
    def set_params
       
        if Ad.find(params[:ad_id]).nil?
                redirect_to root_path, notice: 'Houve algum erro'
            
        else
            @deal = Deal.find(params[:deal_id])    
            @ad = Ad.find(params[:ad_id])
            @colaborator = @deal.colaborator
                
        end
    end
        
end