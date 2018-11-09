class ApiController < ActionController::Base
  rescue_from StandardError, with: :application_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request

  before_action :set_decision_tree

  def set_decision_tree
    @decision_tree ||= DecisionTreeBuilder.new.build
  end

  def record_not_found
    render json: { errors: [{ message: 'Record not found'}] }, status: 404
  end

  def bad_request
    render json: { errors: [{ message: 'Properties are not valid'}] }, status: 400
  end

  def application_error
    render json: { errors: [{ message: 'Something went wrong'}] }, status: 500
  end
end
