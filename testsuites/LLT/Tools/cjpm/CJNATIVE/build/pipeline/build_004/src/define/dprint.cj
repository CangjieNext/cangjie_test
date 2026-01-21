macro package cj_project.define

import std.ast.*

public macro dprint(input: Tokens): Tokens {
    let inputStr = input.toString()
    let result = quote(
        print($(inputStr) + " = ")
        println($(input)))
    return result
}


