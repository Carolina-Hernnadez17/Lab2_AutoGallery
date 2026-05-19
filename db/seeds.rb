# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Fotografia.delete_all
Vehiculo.delete_all
Marca.delete_all

toyota = Marca.create!(nombre_marca: "Toyota", pais_origen: "Japón")
ford = Marca.create!(nombre_marca: "Ford", pais_origen: "Estados Unidos")
bmw = Marca.create!(nombre_marca: "BMW", pais_origen: "Alemania")
audi = Marca.create!(nombre_marca: "Audi", pais_origen: "Alemania")

corolla = toyota.vehiculos.create!(modelo: "Corolla GR-S", anio: 2024, color: "Blanco perlado", precio: 23500)
toyota_camry = toyota.vehiculos.create!(modelo: "Camry Hybrid", anio: 2025, color: "Gris grafito", precio: 31000)
mustang = ford.vehiculos.create!(modelo: "Mustang GT", anio: 2024, color: "Rojo intenso", precio: 42000)
bronco = ford.vehiculos.create!(modelo: "Bronco Sport", anio: 2023, color: "Verde bosque", precio: 36000)
x5 = bmw.vehiculos.create!(modelo: "X5 xDrive", anio: 2025, color: "Negro obsidiana", precio: 68000)
m3 = bmw.vehiculos.create!(modelo: "M3 Competition", anio: 2024, color: "Azul zafiro", precio: 72000)
a4 = audi.vehiculos.create!(modelo: "A4 Sedan", anio: 2024, color: "Plata humo", precio: 47000)
q8 = audi.vehiculos.create!(modelo: "Q8 Sportback", anio: 2025, color: "Blanco glaciar", precio: 79000)

[
	[corolla, "Frontal", "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1200&q=80"],
	[corolla, "Trasera", "https://images.unsplash.com/photo-1542362567-b07e54358753?auto=format&fit=crop&w=1200&q=80"],
	[toyota_camry, "Lateral", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&w=1200&q=80"],
	[mustang, "Frontal", "https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=80"],
	[bronco, "Off-road", "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?auto=format&fit=crop&w=1200&q=80"],
	[x5, "Vista principal", "https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&w=1200&q=80"],
	[m3, "Performance", "https://images.unsplash.com/photo-1503736334956-4c8f8e92946d?auto=format&fit=crop&w=1200&q=80"],
	[a4, "Sedán", "https://images.unsplash.com/photo-1489824904134-891ab64532f1?auto=format&fit=crop&w=1200&q=80"],
	[q8, "Crossover", "https://images.unsplash.com/photo-1493238792000-8113da705763?auto=format&fit=crop&w=1200&q=80"]
].each do |vehiculo, angulo, ruta|
	vehiculo.fotografias.create!(ruta_archivo: ruta, angulo: angulo, fecha_subida: Date.current)
end
