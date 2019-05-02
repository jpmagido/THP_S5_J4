class GossipsController < ApplicationController
 include ApplicationHelper

  before_action :authenticate_user#, only: [:index]

  def index
  	@gossips = Gossip.all 
  end

  def create
    Gossip.create(title: "#{params[:gossip][:title]}", content: "#{params[:gossip][:content]}", user_id: session[:user_id])
    #Tag.create(title: "#{params[:tag]}")
    #JoinTableTagGossip.create(tag_id: Tag.find_by(title: "#{params[:tag]}").id, gossip_id: Gossip.find_by(title:"#{params[:title]}" ).id)
    

    redirect_to gossips_index_path
  end


  def new
    @gossip = Gossip.new

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(title: "#{params[:gossip][:title]}", content: "#{params[:gossip][:content]}", user_id: session[:user_id], comment:"#{params[:gossip][:comment]}" )
    redirect_to gossips_index_path

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_index_path
  end

  def show
	@id_lien = params[:id]
  @gossip_one = Gossip.find(params[:id])
  @gossip_del = Gossip.find(params[:id]).id
  @id_user = User.find(Gossip.find(params[:id]).user_id).id
  @comment_all = Gossip.where(id: params[:id])
 # @coment = Tag.find(JoinTableTagGossip.find(Gossip.find(params[:id]).id).gossip_id).title
  end

  def add_comment
  #@add comment = Gossip.find(params[:id])
  #@add_comment.comment = "23"
  end


private

def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end

