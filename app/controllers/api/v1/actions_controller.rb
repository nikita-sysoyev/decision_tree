class Api::V1::ActionsController < ApiController
  skip_before_action :verify_authenticity_token 
  before_action :load_action, only: %i(show update destroy)
  after_action  :update_tree, only: %i(create update destroy)

  def index
    render json: Action.all
  end

  def show
    render json: @action
  end

  def create
    render json: Action.create!(action_params)
  end

  def update
    render json: @action.update!(action_params)
  end

  def destroy
    @action.destroy
    render json: { result: :ok }
  end

  private

  def load_action
    @action = Action.find(params[:id])
  end

  def update_tree
    @decision_tree = ::DecisionTreeBuilder.new.build
  end

  def action_params
    params.permit(properties: {})
  end

end
