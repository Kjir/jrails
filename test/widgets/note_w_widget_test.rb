require 'test_helper'

class NoteWWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:note_w)
  end
  
  test "display" do
    render_widget :note_w
    assert_select "h1"
  end
end
