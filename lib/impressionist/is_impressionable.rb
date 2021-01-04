module Impressionist
  module IsImpressionable
    extend ActiveSupport::Concern

    module ClassMethods
      def is_impressionable(options={})
        define_association
        @impressionist_cache_options = options

        true
      end

      private

      # By default, adding is_impressionable to an AR model adds a dependent destroy on all of its impressions.
      # We don't want to delete this impression data bc we might need to deliver audit data to a client.
      #
      # original method
      # def define_association
      #   has_many(:impressions,
      #   :as => :impressionable,
      #   :dependent => :delete_all)
      # end
      def define_association
        has_many(:impressions,
        :as => :impressionable)
      end
    end

  end
end
