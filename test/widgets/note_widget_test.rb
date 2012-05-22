require 'test_helper'

class NoteWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:note)
  end
  
  test "display" do
    render_widget :note
    assert_select "h1"
  end
end
