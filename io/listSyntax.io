ShoppingList := List clone
ShoppingList curlyBrackets := method(
	call message arguments
)

shoppingList := ShoppingList doFile("shoppingList.txt")
shoppingList at(3) println