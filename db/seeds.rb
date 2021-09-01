# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TiposPago.create([
    {pago: 'efectivo'},
    {pago: 'tarjeta'},
])

EstadosPedido.create([
    {estado: 'solicitado'},
    {estado: 'enviado'},
    {estado: 'entregado'},
])

Region.create([
    { nombre: 'Primera Región'},
    { nombre: 'Segunda Región'},
    { nombre: 'Tercera Región'},
    { nombre: 'Cuarta Región'},
    { nombre: 'Quinta Región'},
    { nombre: 'Sexta Región'},
    { nombre: 'Septima Región'},
    { nombre: 'Octava Región'},
    { nombre: 'Novena Región'},
    { nombre: 'Décima Región'},
    { nombre: 'Décima Primera Región'},
    { nombre: 'Décima Cuarta Región'},
    { nombre: 'Décima Quinta Región'},
    { nombre: 'Décima Sexta Región'},
    { nombre: 'Región Metropolitana'},
])