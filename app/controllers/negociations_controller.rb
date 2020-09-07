class NegociationsController < ApplicationController
before_action :authentic_colab?
before_action :set_negociations_params
   
   def index
    @negociations = @ad.negociations
    
    end 

   def new
    @negociation = Negociation.new
   end

   def create 
    @negociation = Negociation.new(params.require(:negociation).permit(:ask).merge(colaborator: current_user.colaborator, 
                                    ad: @ad))
    if @negociation.save
        redirect_to @ad, notice: 'Proposta enviada'
    else
        render :new, notice: 'Houve algum erro'
    end
   end  
   def edit
    @negociation = Negociation.find(params[:id])
   end
   def update
    @negociation = Negociation.find(params[:id])
        if @negociation.update!(params.require(:negociation).permit(:answer, :current_price))
            redirect_to @ad, notice: 'Contra-proposta enviada'
        else
            render :edit, notice: 'Houve algum erro'    
        end
    
    end
    def onlyus
        @negociation = Negociation.find(params[:id])
        @negociations = @ad.negociations.where(colaborator: @negociation.colaborator)
        if !Deal.find_by(colaborator: @negociation.colaborator).nil?
            @deal = Deal.find_by(colaborator: @negociation.colaborator)
        end
        render :index
    end


private

   def set_negociations_params
    @ad = Ad.find(params[:ad_id])
   end
   def authentic_colab?
         if current_user.visitor?
             redirect_to root_path, alert: 'Você não tem permissão de acesso'
         end
   end

end 
