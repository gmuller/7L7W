OperatorTable addAssignOperator(":", "atParseHash")

Builder := Object clone
Builder tabDepth := 0
Builder forward := method(
		arguments := call message arguments
	
		attrs := ""
    	if(arguments size > 0 and arguments at(0) name == "curlyBrackets",
     		attrs = doMessage(arguments removeFirst)
    	)
		tabDepth repeat(write("  "))
		write("<", call message name, attrs, ">\n")
		arguments foreach(arg,	
			tabDepth = tabDepth + 1
			content := self doMessage(arg)
			if(content type == "Sequence") then(
				tabDepth = tabDepth + 1
				tabDepth repeat(write("  "))
				write(content, "\n")
				tabDepth = tabDepth - 1
				)
			tabDepth = tabDepth - 1
			)
		tabDepth repeat(write("  "))
		write("</", call message name, ">\n")
)

Builder curlyBrackets := method(
    call message arguments map(arg, self doMessage(arg)) join("")
)

Builder atParseHash := method(
    key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    value := call evalArgAt(1)
    " #{key}=\"#{value}\"" interpolate
)

doFile("testBuilder.txt")