require! {
	'./'.Part
	'./'.Status
	'./'.Header
	\expect.js
}

export
	Part:
		is:
			'is just instanceof': ->
				expect (Part.is new Part) .to.be.ok!
				expect (Part.is \nope)    .not.to.be.ok!

	Status:
		'constructor sets code': ->
			expect new Status 500 .to.have.property \code 500
		'can be called newless': ->
			expect Status! .to.be.a Status
		'is a subclass of Part': ->
			expect new Status .to.be.a Part

	Header:
		'constructor sets name and value': ->
			h = new Header \a \b
			expect h .to.have.property \name  \a
			expect h .to.have.property \value \b
		'can be called newless': ->
			expect Header! .to.be.a Header
		'is a subclass of Part': ->
			expect new Header .to.be.a Part

