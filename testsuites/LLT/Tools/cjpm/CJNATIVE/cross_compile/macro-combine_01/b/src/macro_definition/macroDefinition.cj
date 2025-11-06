macro package b.macro_definition

import std.ast.*
import demo.*

public macro TestDef(input: Tokens): Tokens {
    println("I'm in macro body")
    demo()
    return input
}
