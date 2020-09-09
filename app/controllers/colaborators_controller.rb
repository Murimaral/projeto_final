class ColaboratorsController < ApplicationController
   before_action :id_of_company, only: [:new, :create]
   
   def index
      @colaborators = Colaborator.where(company: current_user.colaborator.company)
   end
   def show
      @colaborator = Colaborator.find(params[:id])
   end
     
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
    def edit
      @colaborator = Colaborator.find(params[:id])
    end
    def update
      @colaborator = Colaborator.find(params[:id])
      if @colaborator.update!(params.require(:colaborator).permit(:name, :social_name,
                                          :birth_date, :cpf, :address, :section, :role))
              redirect_to @colaborator, notice: 'Dados atualizados com sucesso'
      else
         render :edit, notice: 'Erro de preenchimento dos campos'    
      end
   end                          

    def search
      if params[:q].present? 
         @colaborators = Colaborator.where(company: current_user.colaborator.company).where('social_name LIKE ?', "%#{params[:q]}%")
      elsif params[:p].present? 
         @colaborators = Colaborator.where(company: current_user.colaborator.company).where('section LIKE ?', "%#{params[:p]}%")
      elsif params[:o].present? 
         @colaborators = Colaborator.where(company: current_user.colaborator.company).where('role LIKE ?', "%#{params[:o]}%")
      else
         return redirect_to colaborators_path, notice: 'Para realizar uma pesquisa, insira um valor válido'
      end
      render :index
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