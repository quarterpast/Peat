require! {
	'./'.Part
	'./'.Status
	'./'.Header
	'karma-sinon-expect'.expect
	path
}

delete require.cache[path.resolve 'index.js']
peat2 = require './'

export
	Part:
		is:
			'is pretty much just instanceof': ->
				expect (Part.is new Part)   .to.be.ok!
				expect (Part.is new Status) .to.be.ok!
				expect (Part.is new Header) .to.be.ok!
				expect (Part.is \nope)      .not.to.be.ok!
			'can detect objects from another instance of the module': ->
				expect (Part.is new peat2.Part)   .to.be.ok!
				expect (Part.is new peat2.Status) .to.be.ok!
				expect (Part.is new peat2.Header) .to.be.ok!
			'returns the object': ->
				expect (Part.is p = new Part)   .to.be p
				expect (Part.is s = new Status) .to.be s
				expect (Part.is h = new Header) .to.be h

		run:
			'is abstract': ->
				expect (new Part)~run .to.throw-exception /abstract/

	Status:
		'constructor sets code': ->
			expect new Status 500 .to.have.property \code 500
		'can be called newless': ->
			expect Status! .to.be.a Status
		'is a subclass of Part': ->
			expect new Status .to.be.a Part
		'run sets the status code': ->
			st = new Status 153
			st.run response = {}
			expect response .to.have.property \statusCode 153

	Header:
		'constructor sets name and value': ->
			h = new Header \a \b
			expect h .to.have.property \name  \a
			expect h .to.have.property \value \b
		'can be called newless': ->
			expect Header! .to.be.a Header
		'is a subclass of Part': ->
			expect new Header .to.be.a Part
		'run sets a header': ->
			he = new Header \foo \bar
			res = set-header: expect.sinon.stub!
			he.run res
			expect res.set-header .to.be.called-with \foo \bar

