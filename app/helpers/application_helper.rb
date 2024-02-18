# app/helpers/application_helper.rb
module ApplicationHelper
    def flip_direction(column)
      column == session[:sort] && session[:dir] == 'asc' ? 'desc' : 'asc'
    end
  end
  