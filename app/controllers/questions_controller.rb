class QuestionsController < ApplicationController
before_action :set_ad_params
before_action :authentic_colab?

def index
   @questions = Question.where(ad: @ad)
end

def new
   @question = Question.new
end

def create
   @questions = Question.where(ad: @ad)
   @question = Question.new(params.require(:question).permit(:ask).merge(ad: @ad))
   if @question.save
      redirect_to ad_questions_path(@ad), notice: 'Pergunta enviada, aguarde a resposta do vendedor'
   else
      render :new 
   end
end

def edit
    @question = Question.find(params[:id])
end

def update
    @question = Question.find(params[:id])
    if @question.update(params.require(:question).permit(:answer))
        redirect_to ad_questions_path(@ad), notice: 'Resposta enviada com sucesso'
    else
        render :edit, notice: 'Houve algum erro'    
    end
end



private
def set_ad_params
    @ad = Ad.find(params[:ad_id])
end
def authentic_colab?
    if current_user.visitor?
        redirect_to root_path, alert: 'Você não tem permissão de acesso'
    end
end


end 