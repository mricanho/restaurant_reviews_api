class ApplicationController < ActionController::API
    # Global error handling
    rescue_from ActiveRecord::RecordNotFound,  with: :render_not_found
    rescue_from ActionController::ParameterMissing, with: :render_bad_request
    rescue_from ActiveRecord::RecordInvalid,   with: :render_unprocessable

    # Enforce JSON format for all API requests
    before_action :force_json

    private

    def force_json
      request.format = :json
    end

    def render_not_found(error)
      # Use model name if available, otherwise fallback to generic message
      model = error.try(:model)
      message = model.present? ? "#{model} not found" : "Resource not found"
      render json: { error: message }, status: :not_found
    end

    def render_bad_request(error)
      render json: { error: error.message }, status: :bad_request
    end

    def render_unprocessable(error)
      render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
    end

    # Pagination helper
    def pagination_params(default_per_page: 20, max_per_page: 100)
      page     = params.fetch(:page, 1).to_i.clamp(1, 1_000_000)
      per_page = params.fetch(:per_page, default_per_page).to_i.clamp(1, max_per_page)
      { page:, per_page: }
    end
end
