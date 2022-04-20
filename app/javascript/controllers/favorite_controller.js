import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = [ "icon" ]
  static values = { id: Number }

  toggleFavorite(e) {
    e.preventDefault()
    const url = `/api/v1/events/${this.idValue}/favorite`
    const token = document.querySelector("meta[name=csrf-token]").content
    axios.defaults.headers.common["X-CSRF-Token"] = token;

    axios.post(url)
         .then((res) => {
           const icon = this.iconTarget
           if (res.data.status === "added") {
             icon.classList.remove("far")
             icon.classList.add("fas", "text-danger")
           } else {
             icon.classList.remove("fas")
             icon.classList.add("far")
           }
         })
         .catch((err) => {
           console.log(err)
         })
  }
}