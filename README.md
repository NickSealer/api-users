## Instrucciones
Antes de comenzar:
```
rails db:migrate
rails s
```
**1**
El usuario se registra: /api/v1/auth
```
{
	"name": "name",
	"email": "email@email.com",
	"password": "password",
	"password_confirmation": "password"
}
```
**2**
Login: /api/v1/auth/sign_in; la api responde enviando el usuario y los headers :
```
{
	"email": "email@email.com",
	"password": "password"
}
```
**4**
Headers:
```
access-token
client
uid
```
**5**
Para guardar y actualizar son los siguientes campos:
```
{
	"name": "name",
	"surname": "surname",
	"celphone": "celphone",
	"email": "email@email.com",
	"password": "password",
	"address": "address",
	"art": "art",
	"movie": "some movie",
	"Music": "music gender"
}
```

**6**
endpoinst:
```
POST   /api/v1/auth             Regitro
POST   /api/v1/auth/sign_in     Login
GET    /api/v1/currentUser      Usuario actual
GET    /api/v1/health           Estado de la Api (Sin autenticación)
GET    /api/v1/users            Index
POST   /api/v1/users            Create
GET    /api/v1/users/:id        Show
PUT    /api/v1/users/:id        Update
DELETE /api/v1/users/:id        Destroy
```
