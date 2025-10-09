macro package define

public macro testMacro(a: Tokens) { a }
public macro testMacro(a: Tokens, b: Tokens): Tokens { return quote() }