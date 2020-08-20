import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      ghostClass: "ghost-class",
      dragClass: "drag-class",
      animation: 250,
      

    })
  }

  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    console.log(event.newIndex + 1)
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}
