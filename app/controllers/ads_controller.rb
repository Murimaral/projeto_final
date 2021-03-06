class AdsController < ApplicationController
    before_action :authentic_colab?
    before_action :set_colab, only: [:index, :create, :update, :show, :lowprice, :filterads]
   
    
    
   def index
      @ads = Ad.where(colaborator: @company.colaborators, status: :available)
      
   end
   
   def new
      @ad = Ad.new
   end

   def create
      @ad = Ad.new(ad_params)
      if @ad.save
        redirect_to @ad, notice: 'Anúncio feito com sucesso!'
      else
         render :new  
      end
   end

   def show
      
      @ad = Ad.find(params[:id])
      @cat = Ad.categories[@ad.category]
      @deals = Deal.where(ad: @ad)
      anydeals
   end

   def edit
      @ad = Ad.find(params[:id])
      if current_user.colaborator.id != @ad.colaborator.id 
         return redirect_to root_path, notice: 'Você não tem permissão para essa ação'
      end
   end 

   def update
      @ad = Ad.find(params[:id])
      if current_user.colaborator.id != @ad.colaborator.id   
         return redirect_to root_path, notice: 'Você não tem permissão para essa ação'
      else             
         if @ad.update!(ad_params)
            redirect_to @ad, notice: 'Alterações salvas com sucesso!'
         else
            render :edit                  
         end
      end
   end

   def destroy
      @ad = Ad.find(params[:id])
      if owner? 
         if !@ad.sold?
            @ad.destroy
            redirect_to ads_path, notice: 'Anúncio apagado com sucesso!'
         else
            redirect_to ads_path, notice: 'Não é possível apagar o anúncio de um produto vendido'
         end
      else
         redirect_to root_path, notice: 'Você não tem permissão para essa ação'
      end 
   end 
   
   def owned
      @colaborator = current_user.colaborator
      @ads = Ad.where(colaborator: @colaborator)
      render :index
   end
   def disab
      @ad = Ad.find(params[:id])
      if owner?
         @ad.disab!
         redirect_to ads_path, notice: 'Anúncio desabilitado, para desfazer, acesse Meus anúncios e selecione a opção Habilitar anúncio'
      else
         redirect_to root_path, notice: 'Você não tem permissão para essa ação'
      end
   end
   def enab
      @ad = Ad.find(params[:id])
      if owner?
         @ad.available!
         redirect_to ads_path, notice: 'Anúncio habilitado'
      else
         redirect_to root_path, notice: 'Você não tem permissão para essa ação'
      end
   end

   def filterads
    
      if params[:q].present? 
         @ads = Ad.where(colaborator: @company.colaborators, status: :available).where('name LIKE ?', "%#{params[:q]}%")
      elsif params[:p].present? 
         @ads = Ad.where(colaborator: @company.colaborators, status: :available).where(category: params[:p])
      else
         return redirect_to ads_path, notice: 'Para realizar uma pesquisa, insira um valor válido'
      end
      render :index
   end

   def lowprice
      @ads = Ad.where(colaborator: @company.colaborators, status: :available).order(cost: :asc)
      render :index
   end




private
def ad_params
    params.require(:ad).permit(:name, :category,
    :description, :cost, :photo).merge(colaborator_id: @colaborator.id)

end
def authentic_colab?
    if current_user.visitor?
        redirect_to root_path, alert: 'Você não tem permissão de acesso'
    end
end
def set_colab
   @company = current_user.colaborator.company
   @colaborator = current_user.colaborator
end
def anydeals
   if !Deal.find_by(ad: @ad, colaborator: @colaborator).nil?   
      @deal = Deal.find_by(ad: @ad, colaborator: @colaborator)  
   end
end     
def owner?
   current_user.colaborator.id == @ad.colaborator.id 
end

end