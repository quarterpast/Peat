# data Part = Header { name :: String, value :: String }
#           | Status { code :: Number}
#           | Chunk Buffer
# type Result = Stream Part
export class Part
	@is = (v)-> v instanceof this

export class Header extends Part
	(@name, @value)~>

export class Status extends Part
	(@code)~>
