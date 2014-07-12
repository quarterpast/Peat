# Peat [![Build Status](https://travis-ci.org/quarterto/Peat.svg)](https://travis-ci.org/quarterto/Peat)

The classes that [Oban](https://github.com/quarterto/Oban)) uses for responses. `require` this in your route modules, and Oban in your server module.

`npm install peat`

## API
### Part
Common base class. Extend it, don't use it.

### Status(code)
Tells Oban to set the HTTP status.

### Header(name, value)
Tells Oban to set an HTTP header.

## Extending
So you want to extend Peat? Good for you! Just grab a reference to `Part`, subclass it using [your favourite method](https://github.com/quarterto/Estira), and give it a useful `run` method. Let's say you want to add a `Timeout` part that calls `res.setTimeout`:

```javascript
var Timeout = Estira.extend.call(Part, {
  initialize: function(timeout) {
		this.timeout = timeout;
	},
	run: function(res) {
		res.setTimeout(this.timeout);
	}
});
```

## Licence
MIT.
