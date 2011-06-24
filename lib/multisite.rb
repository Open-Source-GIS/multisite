require "multisite/version"
require 'multisite/default_scope_override'

module Multisite
  class << self
    def current_site
      @@current_site ||= nil
    end

    def current_site=(the_site)
      @@current_site = the_site
    end
  end
end
