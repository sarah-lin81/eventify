import { Controller } from "stimulus"
import FroalaEditor from "froala-editor"
import "froala-editor/css/froala_editor.min.css"

export default class extends Controller {
  connect() {
    new FroalaEditor(this.element, {})
  }
}
