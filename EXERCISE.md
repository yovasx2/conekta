Desarrolla un webservice que simule el api de pagos de conekta

1. POST /accounts

  Body params:

  * name

  Response params:

  * public_key
  * private_key

2. POST /tokenize

  Body params:

  * card_number
  * expiration_month
  * expiration_year
  * secure_code

  Response params:

  * card_token

3. POST /charges

  Body params:

  * card_token
  * amount

Consideraciones del ejercicio

* Cuando se tokeniza la tarjeta, el secure_code debe de encriptarse y expirar en
10 minutos, para que no pueda volver a hacerse un cargo con ese token, ni leer el código.
* Se deben tener pruebas unitarias de cada endpoint y los escenarios posibles.
* El software debe ser escrito en rails
