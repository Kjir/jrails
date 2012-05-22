class NoteController < ApplicationController
  include Apotomo::Rails::ControllerMethods
  
  has_widgets do |root|
    root << widget(:note)
  end
  
  def index
    @note_pages, @notes = paginate :note, :per_page => 10
  end
end
