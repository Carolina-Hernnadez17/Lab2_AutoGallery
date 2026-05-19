import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "brand", "price", "year", "color"]

  open(event) {
    const source = event.currentTarget
    const modelo = source.dataset.vehicleDiscoverModelo || ""
    const precio = source.dataset.vehicleDiscoverPrecio || "0"
    const anio = source.dataset.vehicleDiscoverAnio || "--"
    const color = source.dataset.vehicleDiscoverColor || "--"
    const marca = source.dataset.vehicleDiscoverMarca || ""

    this.titleTarget.textContent = modelo
    this.brandTarget.textContent = marca
    this.priceTarget.textContent = this.formatCurrency(precio)
    this.yearTarget.textContent = anio
    this.colorTarget.textContent = color
  }

  close() {
    const modalElement = document.getElementById("discoverVehicleModal")
    if (!modalElement || !window.bootstrap) {
      return
    }

    const instance = window.bootstrap.Modal.getInstance(modalElement) || new window.bootstrap.Modal(modalElement)
    instance.hide()
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
