# frozen_string_literal: true

module Api
  module V1
    # Controller for services
    class ServicesController < ApplicationController
      def index
        services = Service.all
        render json: services
      end

      def show
        service = Service.find_by(id: params[:id])
        if !service
          render json: { success: false }, status: :unprocessable_entity
        else
          render json: service
        end
      end
    end
  end
end
