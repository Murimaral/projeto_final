class ColaboratorsController < ApplicationController
   def new
      @colaborator = Colaborator.new
   end 
   def create
      @colaborator = Colaborator.new(colab_params)
      if @colaborator.save!
        redirect_to root_path, notice: "Ahoy! Seja Bem-vindo(a) à bordo, #{@colaborator.social_name}"
      else
        render :new
      end   
    end

   private
   def colab_params
      params.require(:colaborator).permit(:name, :social_name, :birth_date,
                                        :cpf, :address, :role).merge(user_id: current_user.id,
                                        company_id: domain_look)
   end
   def domain_look
      Company.find_by(domain: current_user.email.match(/@.*/).to_s).id 
  
    end


end