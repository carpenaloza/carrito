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
# Region.destroy_all

# Region.create([
#     { nombre: 'Primera Región Tarapacá'},
#     { nombre: 'Segunda Región Antofagasta'},
#     { nombre: 'Tercera Región Atacama'},
#     { nombre: 'Cuarta Región Coquimbo'},
#     { nombre: 'Quinta Región Valparaíso'},
#     { nombre: 'Sexta Región Ohiggins'},
#     { nombre: 'Septima Región El Maule'},
#     { nombre: 'Octava Región El Bío Bío'},
#     { nombre: 'Novena Región La Araucanía'},
#     { nombre: 'Décima Región Los Lagos'},
#     { nombre: 'Décima Primera Región Aysén'},
#     { nombre: 'Décima Segunda Región Magallanes y Antártica Chilena'},
#     { nombre: 'Décima Tercera Región Metropolitana de Santiago'},
#     { nombre: 'Décima Cuarta Región Los Ríos'},
#     { nombre: 'Décima Quinta Región Arica y Parinacota'},
#     { nombre: 'Décima Sexta Región Ñuble'},
# ])