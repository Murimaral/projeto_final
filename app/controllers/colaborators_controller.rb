class ColaboratorsController < ApplicationController
   before_action :id_of_company, only: [:new, :create]
  def new
      @colaborator = Colaborator.new
   end 
   def create
      @colaborator = Colaborator.new(colab_params)
      if @colaborator.save
        @colaborator.user.colab!
        redirect_to root_path, notice: "Ahoy! Seja Bem-vindo(a) à bordo, #{@colaborator.social_name}"

      else
        render :new
      end   
    end

   private
   def colab_params
      params.require(:colaborator).permit(:name, :social_name, :birth_date,
                                        :cpf, :address, :role).merge(user_id: current_user.id,
                                        company_id: @company)
   end
   
   def id_of_company
      if  Company.find_by(domain: current_user.email.match(/@.*/).to_s).nil?
          redirect_to root_path, alert: 'Não há empresa cadastrada com esse domínio'
      else  
         @company =  Company.find_by(domain: current_user.email.match(/@.*/).to_s).id 
      end 
    end


end