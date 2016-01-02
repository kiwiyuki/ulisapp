class Admin::AdminController < ApplicationController
    before_filter :basic
    
    private
    def basic
        authenticate_or_request_with_http_basic do |user, pass|
            user == ENV['ADMIN_USER'] && pass == ENV['ADMIN_PASS']
        end
    end
end