
macro package AAA

internal import std.ast.*

public macro NN(input: Tokens): Tokens {
    quote($(parseDecl(input)))
}
