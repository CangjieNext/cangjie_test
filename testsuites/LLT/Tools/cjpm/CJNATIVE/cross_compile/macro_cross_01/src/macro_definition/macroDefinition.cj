macro package demo.macro_definition

import std.ast.*
import dep.aoo.*

public macro TestDef(input: Tokens): Tokens {
    println("I'm in macro body")
    depAoo()
    return input
}

