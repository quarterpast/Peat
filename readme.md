# Oban responses

The classes that [Oban](/quarterto/Oban) uses for responses. `require` this in your route modules, and Oban in your server module.

`npm install oban-response`

## API
### Part
Common base class. Extend it, don't use it.

### Status(code)
Tells Oban to set the HTTP status.

### Header(name, value)
Tells Oban to set an HTTP header.

## Licence
MIT.