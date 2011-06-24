require 'active_support'

module Multisite
  module DefaultScopeOverride
    extend ActiveSupport::Concern

    included do
      default_scope lambda{
        where(:site_id => Multisite.current_site.id)
      }
    end
  end
end
