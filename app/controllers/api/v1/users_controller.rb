class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_user, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json:{error: e.message}, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json:{error: e.message}, status: :unprocessable_entity
  end

  rescue_from SQLite3::ConstraintException do |e|
    render json: {error: "#{e.message} There are accounts associated to this category #{@category.name}"}, status: :failed_dependency
  end

  rescue_from Exception do |e|
    render json:{error: e.message}, status: :internal_error
  end

  def user
    @user = current_api_v1_user
    render json: @user, status: :ok
  end

  def index
    @users = User.all.order(:created_at)
    if !params[:search].nil? && params[:search].present?
      @users = SearchService.search_user(@users, params[:search])
    end
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.create!(create_params)
    if @user.save
      msg = {:message => "User #{@user.name} created."}
      render json: msg, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update!(create_params)
      msg = {:message => "User #{@user.name} updated."}
      render json: msg, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    msg = {:message => "User #{@user.name} deleted."}
    render json: msg, status: :ok
  end

  def set_user
    @user = User.find(params[:id])
  end

  def create_params
    params.permit(:name, :surname, :email, :celphone, :password, :address, :art, :movie, :music)
  end

end
