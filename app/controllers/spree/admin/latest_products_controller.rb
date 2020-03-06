module Spree
  module Admin
    class LatestProductsController < ResourceController
      PER_PAGE = 25

      def index
        @latest_products = collection
      end

      private

      def collection
        params[:q] ||= {}
        @search = Spree::LatestProduct.ransack(params[:q])
        @collection = @search.result.includes([:product]).page(params[:page]).per(PER_PAGE)
      end
    end
  end
end
