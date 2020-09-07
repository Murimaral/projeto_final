class CompaniesController < ApplicationController
    before_action :authentic_admin?
    def index
        @companies = Company.all 
    end

    def new
        @company = Company.new 
    end

    def create
        @company = Company.new(company_params)
        if @company.save 
            redirect_to @company, notice: 'Cadastro realizado com sucesso!'
        else
            render :new   
        end
    end
    
    def show
        @company = Company.find(params[:id])
    end

   
    private
    def company_params
        params.require(:company).permit(:name, :cnpj, :domain)
    end
    def authentic_admin?
        if !current_user.admin?
            redirect_to root_path, alert: 'Você não tem permissão de acesso'
        end
    end
end
