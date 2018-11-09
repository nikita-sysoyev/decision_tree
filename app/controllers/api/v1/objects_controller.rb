class Api::V1::ObjectsController < ApiController

  def fetch_tree
    render json: @decision_tree
  end

end
