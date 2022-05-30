-- 1.1. Desarrollar el Proyecto

-- A continuación, creará su propia base de datos de red social con las siguientes colecciones:
-- Users
-- Posts
--     Comments

use myFirstDB

db.createCollection('users')

db.createCollection('posts')

-- 1.2. Ejecute las siguientes consulta

-- 1.2.1 INSERTAR DATOS

-- Insertar al menos 15 publicaciones nuevas con almenos 2 comentarios por publicación:
--     Title
--     Body
--     Username
--     Comments
--         Username
--         Body

db.posts.insertMany([
    {title: "Post 1", body: "Body 1", username: "user1", comments: [{username: "user2", body: "Comment 1"}, {username: "user12", body: "Comment 2"}]},
    {title: "Post 2", body: "Body 2", username: "user2", comments: [{username: "user15", body: "Comment 1"}, {username: "user4", body: "Comment 2"}]},
    {title: "Post 3", body: "Body 3", username: "user3", comments: [{username: "user1", body: "Comment 1"}, {username: "user2", body: "Comment 2"}]},
    {title: "Post 4", body: "Body 4", username: "user4", comments: [{username: "user9", body: "Comment 1"}, {username: "user7", body: "Comment 2"}]},
    {title: "Post 5", body: "Body 5", username: "user5", comments: [{username: "user10", body: "Comment 1"}, {username: "user8", body: "Comment 2"}]},
    {title: "Post 6", body: "Body 6", username: "user6", comments: [{username: "user11", body: "Comment 1"}, {username: "user1", body: "Comment 2"}]},
    {title: "Post 7", body: "Body 7", username: "user7", comments: [{username: "user14", body: "Comment 1"}, {username: "user15", body: "Comment 2"}]},
    {title: "Post 8", body: "Body 8", username: "user8", comments: [{username: "user3", body: "Comment 1"}, {username: "user2", body: "Comment 2"}]},
    {title: "Post 9", body: "Body 9", username: "user9", comments: [{username: "user2", body: "Comment 1"}, {username: "user1", body: "Comment 2"}]},
    {title: "Post 10", body: "Body 10", username: "user10", comments: [{username: "user11", body: "Comment 1"}, {username: "user8", body: "Comment 2"}]},
    {title: "Post 11", body: "Body 11", username: "user1", comments: [{username: "user15", body: "Comment 1"}, {username: "user7", body: "Comment 2"}]},
    {title: "Post 12", body: "Body 12", username: "user2", comments: [{username: "user1", body: "Comment 1"}, {username: "user6", body: "Comment 2"}]},
    {title: "Post 13", body: "Body 13", username: "user3", comments: [{username: "user5", body: "Comment 1"}, {username: "user6", body: "Comment 2"}]},
    {title: "Post 14", body: "Body 14", username: "user4", comments: [{username: "user6", body: "Comment 1"}, {username: "user2", body: "Comment 2"}]},
    {title: "Post 15", body: "Body 15", username: "user5", comments: [{username: "user7", body: "Comment 1"}, {username: "user2", body: "Comment 2"}]}  
])

-- Insertar al menos 10 nuevos usuarios:
--     Username
--     Email
--     Age

db.users.insertMany([
    {username: "user1", email: "user1@mail.com", age: 20},
    {username: "user2", email: "user2@mail.com", age: 25},
    {username: "user3", email: "user3@mail.com", age: 30},
    {username: "user4", email: "user4@mail.com", age: 35},
    {username: "user5", email: "user5@mail.com", age: 40},
    {username: "user6", email: "user6@mail.com", age: 45},
    {username: "user7", email: "user7@mail.com", age: 50},
    {username: "user8", email: "user8@mail.com", age: 55},
    {username: "user9", email: "user9@mail.com", age: 60},
    {username: "user10", email: "user10@mail.com", age: 65}    
])



-- 1.2.2 ACTUALIZAR DATOS

-- Actualizar publicaciones:
--     Actualiza todos los campos de una publicación

db.posts.updateOne({ title: "Post 1"},
{$set: {title: "Post nuevo", body: "Body nuevo", username: "user nuevo", comments: [{username: "user nuevo", body: "Comment nuevo"}]}})

--     Cambiar el body de una publicación.

db.posts.updateOne({title: "Post 2"},
{
    $set: {
        body: "cambio solo body de post 2"
    }
})

--     Actualizar comentarios:
--         Cambiar el body de un comentario.

db.posts.updateOne({title: "Post 3"},
{
    $set: {
        comments:[{username:"user3", body: "cambio body comentario de post 3"}] 
    }
})

-- Actualizar usuarios:
--     Actualiza todos los campos de un usuario

db.users.updateOne({ username: "user1"},
{$set: {username: "new user1", email:"newuser@gmail.com", age: 15}})

--     Cambiar el email de dos usuarios es decir hacer la query dos veces.

db.users.updateOne({username: "user2"},
{$set: {username:"user2", email:"newuser2mail@mail.com", age:25}})

db.users.updateOne({username: "user3"},
{$set: {username:"user3", email:"newuser3mail@mail.com", age:30}})

--     Aumenta en 5 años la edad de un usuario

db.users.updateOne({username: "user4"},
{$set: {username:"user4", email:"user4@mail.com", age:40}})




-- 1.2.3 OBTENER DATOS

-- Seleccionar todas las publicaciones

db.posts.find()

-- Selecciona las publicaciones que coincidan con el username indicado

db.posts.find({username: "user2"})

-- Seleccione todos los usuarios con una edad mayor a 20

db.users.find({age:{$gt: 20}})

-- Seleccione todos los usuarios con una edad inferior a 23

db.users.find({age:{$lt: 23}})

-- Seleccione todos los usuarios que tengan una edad entre 25 y 30 años

db.users.find({age:{$gt: 25, $lt: 30}})

-- Muestra los usuarios de edad menor a mayor y viceversa

db.users.find().sort({age: 1})
db.users.find().sort({age: -1})

-- Seleccione el número total de usuarios

db.users.find().count()

-- Seleccione todas las publicaciones de la siguiente manera: Título de la publicación: "título de las publicaciones"

db.posts.createIndex({title:'text'})

db.posts.find({    
    $text: {
        $search: "\"título de las publicaciones\""
    }
})

-- Selecciona solo 2 usuarios

db.users.find().limit(2)

-- Busca por title 2 publicaciones

db.posts.find({title: "Post 15" }).limit(2)


-- 1.2.4 BORRAR DATOS

-- Elimina a todos los usuarios con una edad mayor a 30

db.users.deleteMany({age: {$gt: 30}})


-- 1.3 Extra

-- Seleccione el número total de publicaciones que tienen más de un comentario

db.posts.find({ $or:[{comments: {$not:{$size:0}}, comments: {$not:{$size:1}}}]}).count()

-- Seleccione la última publicación creada

db.posts.find().sort({date: -1}).limit(1)

-- Selecciona 5 publicaciones y que sean las últimas creadas

db.posts.find().sort({date: -1}).limit(5)

-- Elimina todas las publicaciones que tengan más de un comentario

db.posts.deleteMany({$or:[{comments: {$not:{$size:0}}, comments: {$not:{$size:1}}}]})