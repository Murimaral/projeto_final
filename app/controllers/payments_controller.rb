class PaymentsController < ApplicationController
   before_action :authentic_colab?
   before_action :set_params
    def show
        @payment = Payment.find(params[:id])
    end
    def edit
        @payment = Payment.find(params[:id])
    end
    def update
        @payment = Payment.find(params[:id])
        if @payment.update!(params.require(:payment).permit(:delivery_address))
            redirect_to ad_negociation_deal_payment_path(@ad, @negociation, @deal,@payment), notice:  'Trato feito! Assim que for confirmado o pagamento, o envio será realizado'
        end

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
                @ad = Ad.find(params[:ad_id])
                @negociation = Negociation.find(params[:negociation_id])
                @colaborator = @negociation.colaborator
                @deal = Deal.find(params[:id])
             
        end
    end
        
end