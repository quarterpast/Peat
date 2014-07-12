# data Part = Header { name :: String, value :: String }
#           | Status { code :: Number}
#           | Chunk Buffer
# type Result = Stream Part
export class Part
	@is = (v)-> if v instanceof this then v else false
	run: -> throw new Error 'abstract'

export class Header extends Part
	(@name, @value)~>
	run: (res)->
		res.set-header @name, @value

export class Status extends Part
	(@code)~>
	run: (res)->
		res.status-code = @code
