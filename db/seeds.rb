# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Reset
Comment.delete_all
New.delete_all
Usuario.delete_all
#New
n1 = New.create(title: 'Noticia1', descent: 'Bajada de titulo 1', body: 'Cuerpo de noticia1')
n2 = New.create(title: 'Noticia2', descent: 'Bajada de titulo 2', body: 'Cuerpo de noticia2')
n3 = New.create(title: 'Noticia3', descent: 'Bajada de titulo 3', body: 'Cuerpo de noticia3')
n4 = New.create(title: 'Noticia4', descent: 'Bajada de titulo 4', body: 'Cuerpo de noticia4')
n5 = New.create(title: 'Noticia5', descent: 'Bajada de titulo 5', body: 'Cuerpo de noticia5')
n6 = New.create(title: 'Noticia6', descent: 'Bajada de titulo 6', body: 'Cuerpo de noticia6')

#comments
Comment.create(username: 'Fernando', body: 'Comentario1', new: n1)
Comment.create(username: 'Diego', body: 'Comentario2', new: n1)
Comment.create(username: 'Fernando', body: 'Comentario3', new: n2)
Comment.create(username: 'Juan', body: 'Comentario4', new: n1)
Comment.create(username: 'Cristobal', body: 'Comentario5', new: n3)

#usuarios
Usuario.create(usuario: 'FernandoAguayo', nombre: 'Fernando', apellido: 'Aguayo', twitter: 'nanoaguayo')
