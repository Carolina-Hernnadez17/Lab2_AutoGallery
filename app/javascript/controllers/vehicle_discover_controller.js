import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "title", "brand", "price", "year", "color", "link"]

  open(event) {
    const source = event.currentTarget
    const modelo = source.dataset.vehicleDiscoverModelo || ""
    const precio = source.dataset.vehicleDiscoverPrecio || "0"
    const anio = source.dataset.vehicleDiscoverAnio || "--"
    const color = source.dataset.vehicleDiscoverColor || "--"
    const marca = source.dataset.vehicleDiscoverMarca || ""
    const imagen = source.dataset.vehicleDiscoverImagen || ""
    const url = source.dataset.vehicleDiscoverUrl || ""

    this.titleTarget.textContent = modelo
    this.brandTarget.textContent = marca
    this.priceTarget.textContent = this.formatCurrency(precio)
    this.yearTarget.textContent = anio
    this.colorTarget.textContent = color

    if (imagen) {
      this.imageTarget.src = imagen
      this.imageTarget.alt = modelo || marca
      this.imageTarget.hidden = false
    } else {
      this.imageTarget.removeAttribute("src")
      this.imageTarget.alt = ""
      this.imageTarget.hidden = true
    }

    if (url) {
      this.linkTarget.href = url
      this.linkTarget.hidden = false
    } else {
      this.linkTarget.removeAttribute("href")
      this.linkTarget.hidden = true
    }

    this.modalTarget.hidden = false
    document.body.classList.add("modal-open")
  }

  close() {
    if (this.hasModalTarget) {
      this.modalTarget.hidden = true
    }

    document.body.classList.remove("modal-open")
  }

  formatCurrency(value) {
    const number = Number(value)
    if (Number.isNaN(number)) {
      return value
    }

    return new Intl.NumberFormat("es-SV", {
      style: "currency",
      currency: "USD",
      maximumFractionDigits: 0,
    }).format(number)
  }
}
