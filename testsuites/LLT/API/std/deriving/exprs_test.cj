/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt --disable-reflection %f -o %output
// (Unix) EXEC: export cjStackSize=1mb && %run %run_opt %output %run_args
// (Windows) EXEC: (set cjStackSize=1MB) && %run %run_opt %output %run_args

protected package std.deriving.resolve.resolve_test

import std.ast.{Token, Tokens, ToTokens, TokenKind, parseExpr, parseDecl, cangjieLex, Expr, TypeNode, ClassDecl, VarDecl
    }
import std.deriving.resolve.{constExprType, bodyDecl, Scope, unionApprox, ScopeKind}
import std.collection.collectArray

// we intentionally don't use unittest and reduce using quote() here
// because of the compilation time that grows too much

main() {
    LiteralTests().root()
    DataFlowTests().root()
    IntersectTests().same()
    ScopeTest().root()
}

class LiteralTests {
    func root() {
        ints()
        floats()
        strings()
        tuples()
        arrays()
        casts()
        ranges()
        quotes()
        binary()
        ifBlocks()
        blocks()
        selfInvokingLambda()
        subscript()
        optionSome()
        nonExprs()
        spawnTest()
    }

    func ints(): Unit {
        testCases(
            [
                SubCase("1", "Int64"),
                SubCase("2i8", "Int8"),
                SubCase("3u16", "UInt16"),
                SubCase("(1)", "Int64"),
                SubCase("4u8", "UInt8"),
                SubCase("5i16", "Int16"),
                SubCase("6i32", "Int32"),
                SubCase("7u32", "UInt32"),
                SubCase("8i64", "Int64"),
                SubCase("9u64", "UInt64")
            ]
        ) {
            c => test(c)
        }
    }

    func floats(): Unit {
        for (pair in [
                SubCase("1.0", "Float64"),
                SubCase("2.0f16", "Float16"),
                SubCase("3.0f32", "Float32"),
                SubCase("4.0f64", "Float64")
            ]) {
            test(pair)
        }
    }

    func strings(): Unit {
        for (pair in [
                SubCase("\"test\"", "String"),
                SubCase("\"\"", "String"),
                SubCase(quote("""
            test
            """), "String")
            ]) {
            test(pair)
        }
    }

    func tuples(): Unit {
        for (pair in [
                SubCase("()", "Unit"),
                SubCase("(1)", "Int64"),
                SubCase("(1, 2)", "(Int64,Int64)"),
                SubCase("(1, true, false)", "(Int64,Bool,Bool)"),
                SubCase("(1, (true, false))", "(Int64,(Bool,Bool))")
            ]) {
            test(pair)
        }
    }

    func arrays(): Unit {
        for (pair in [
                SubCase("[1]", "Array<Int64>"),
                SubCase("[1, 2]", "Array<Int64>"),
                SubCase("[1, 2, 3]", "Array<Int64>"),
                SubCase("[\"\"]", "Array<String>"),
                SubCase("[(1, 2), (10, 20)]", "Array<(Int64,Int64)>")
            ]) {
            test(pair)
        }
    }

    func casts(): Unit {
        testCases(
            [
                SubCase("Int64(1)", "Int64"),
                SubCase("Int8(1)", "Int8")
            ]
        ) {
            pair => test(pair)
        }
    }

    func ranges() {
        test(SubCase("1..10", "Range<Int64>"))
    }

    func quotes() {
        test(SubCase("quote(test)", "ast.Tokens"))
    }

    func binary(): Unit {
        testCases(
            [
                SubCase("1 + 1", "Int64"),
                SubCase("1 - 1", "Int64"),
                SubCase("1 / 1", "Int64"),
                SubCase("-1", "Int64"),
                SubCase("- 1", "Int64"),
                SubCase("-(1)", "Int64"),
                SubCase("1.0 + 1.0", "Float64"),
                SubCase("1.0 - 1.0", "Float64"),
                SubCase("1.0 / 1.0", "Float64"),
                SubCase("-1.0", "Float64"),
                SubCase("- 1.0", "Float64"),
                SubCase("-(1.0)", "Float64")
            ]
        ) {
            pair => test(pair)
        }
    }

    func ifBlocks(): Unit {
        testCases(
            [
                SubCase("if (true) { 1 } else { 2 }", "Int64"),
                SubCase("if (true) { 1 } else if (true) { 2 } else { 3 }", "Int64"),
                SubCase("if (true) { 1 }", "Unit"),
                SubCase("if (true) { 1 } else if (true) { 2 }", "Unit")
            ]
        ) {
            pair => test(pair)
        }
    }

    func blocks(): Unit {
        testCases(
            [
                SubCase("try { 2 } finally {}", "Int64"),
                SubCase("try { 2; true } finally {}", "Bool")
            ]
        ) {
            pair => test(pair)
        }
    }

    func selfInvokingLambda(): Unit {
        testCases(
            [
                SubCase("({ => 1 }())", "Int64"),
                SubCase("({ => true }())", "Bool"),
                SubCase("({ _ => 1.0 }(1))", "Float64")
            ]
        ) {
            pair => test(pair)
        }
    }

    func subscript(): Unit {
        testCases(
            [
                SubCase("([1,2,3])[0]", "Int64"),
                SubCase("([true, false])[0]", "Bool"),
                SubCase("((1, \"a\", true))[0]", "Int64"),
                SubCase("((1, \"a\", true))[1]", "String"),
                SubCase("((1, \"a\", true))[2]", "Bool"),
                SubCase("\"aaa\"[0]", "UInt8")
            ]
        ) {
            pair => test(pair)
        }
    }

    func optionSome(): Unit {
        testCases(
            [
                SubCase("Some(1)", "Option<Int64>"),
                SubCase("Some(true)", "Option<Bool>"),
                SubCase("Option<String>.Some(\"\")", "Option<String>"),
                SubCase("Option<String>.None", "Option<String>")
            ]
        ) {
            pair => test(pair)
        }
    }

    func nonExprs(): Unit {
        testCases(
            [
                SubCase("(throw x)", "Nothing"),
                SubCase("(return 1)", "Nothing"),
                SubCase("(break)", "Nothing"),
                SubCase("(continue)", "Nothing"),
                SubCase("(while (true) {})", "Unit"),
                SubCase("(do { } while (true))", "Unit"),
                SubCase("(for (_ in 1..10) {})", "Unit"),
                SubCase("(if (true) {})", "Unit"),
                SubCase("(i++)", "Unit"),
                SubCase("(i--)", "Unit"),
                SubCase("(i+=10)", "Unit"),
                SubCase("(b = 0)", "Unit")
            ]
        ) {
            pair => test(pair)
        }
    }

    func spawnTest(): Unit {
        testCases(
            [
                SubCase("spawn { 1 }", "Future<Int64>"),
                SubCase("spawn {}", "Future<Unit>")
            ]
        ) {
            pair => test(pair)
        }
    }

    private static func test(pair: SubCase): Unit {
        let blockType = constExprTypeRoot(pair.expr).getOrThrow()
        expect(blockType, pair.expected)
    }
}

class DataFlowTests {
    func root() {
        smokeTest()
        returnExprs()
        capturing()
        classLike()
        classLikeProp()
        classLikeProp2()
        classLikeStatic()
        classLikeStatic2()
        ifLet()
        matchPattern()
    }

    func smokeTest() {
        test(
            quote(
            ({ =>
                let x = { a: Int64 => a + 1 }
                x(1)
            }())
        ),
            "Int64")
    }

    func returnExprs() {
        testCases(
            [
                SubCase(quote({ =>
                return 1
            }()), "Int64"),
                SubCase(quote({ =>
                if (true) { return 2}
                return 1
            }()),
                    "Int64"),
                SubCase(quote({ =>
                1
            }()), "Int64"),
                SubCase(quote({ =>
                if (true) { return 2 }
                1
            }()), "Int64"),
                SubCase(quote({ =>
                if (true) { return "a" }
                return 1
            }()),
                    "Any"),
                SubCase(quote({ =>
                if (true) { return "b" }
                222
            }()), "Any")
            ]
        ) {c => test(c)}
    }

    func capturing() {
        test(
            quote(
            ({ =>
                var a = 1
                let x = { _ => a + 1 }
                x()
            }())
        ),
            "Int64")
    }

    func classLike() {
        test(
            quote(
            class C {
                var a = x()
                C(m: String) {
                    this.a = m
                }
            }
        ),
            "a", "String")
    }

    func classLikeProp() {
        test(
            quote(
            class C {
                var a = x()
                mut prop actualA: String {
                    set(newA) {
                        a = newA
                    }
                }
            }
        ),
            "a", "String")
    }

    func classLikeProp2() {
        test(
            quote(
            class C {
                var a = x
                prop x: String {
                    get() {
                        "aaa"
                    }
                }
            }
        ),
            "a", "String")
    }

    func classLikeStatic() {
        test(
            quote(
            class C {
                var a = x()

                init() {
                    this.a = z()
                }

                static func z() {
                    1
                }
            }
        ),
            "a", "Int64")
    }

    func classLikeStatic2() {
        test(
            quote(
            class C {
                var a = z()

                static func z() {
                    1
                }
            }
        ),
            "a", "Int64")
    }

    func ifLet() {
        testCases(
            [
                SubCase(quote(if (let Some(x) <- Some("")) { x } else { "" }), "String"),
                SubCase(quote(if (let Some(Some(x)) <- Some(Some(""))) { x } else { "" }), "String"),
                SubCase(quote(if (let None <- Some("x")) { "" } else { "" }), "String"),
                SubCase(quote(if (let (a, b, c) <- (1, "a", 3)) { a + c } else { 0 }), "Int64")
            ]
        ) {c => test(c)}
    }

    func matchPattern(): Unit {
        testCases(
            [
                SubCase(quote(match (1) {
                case p: Int64 => p
            }), "Int64"),
                SubCase(quote(match (Some(1)) {
                case Some(p) => p
            }), "Int64"),
                SubCase(quote(match (2) {
                case Some(p) => p
            }), "Int64"),
                SubCase(quote(match (Some(1)) {
                case _ => 2
            }), "Int64"),
                SubCase(quote(match ((1, 2)) {
                case (a,b) => a + b
            }), "Int64")
            ],
            {
                c: SubCase => test(c)
            }
        )
    }

    private func test(tokens: Tokens, expected: String): Unit {
        test(SubCase(tokens, expected))
    }

    private func test(pair: SubCase, scope!: Scope = Scope(None)): Unit {
        let blockType = constExprType(pair.expr, scope).getOrThrow()
        expect(blockType, pair.expected)
    }

    private func test(q: Tokens, name: String, expectedType: String) {
        let classScope = Scope(None, kind: ClassLikeScope)
        let decl = parseDecl(q) as ClassDecl ?? throw Exception()

        bodyDecl(decl.body, classScope)

        let aType = classScope.lookup(name).resolvedType
        expect(aType, expectedType)
    }
}

class ScopeTest {
    func root() {
        toStringTest()
        lookupSmokeTest()
    }

    func toStringTest() {
        let scope = scopeOf(quote(
            class A {
                let a = 1
            }
        ))
        let items = scope.toString().removeSuffix(")").split(",")[1..].iterator().map {it: String => it.trimAscii()} |>
            collectArray
        expect(items.toString(), "[a:Int64]")
    }

    func lookupSmokeTest() {
        let scope = scopeOf(
            quote(
            class A {
                let a = 1
                let b = someFunc()
            }
        ))
        let resultA = scope.lookup("a")
        if (!(resultA.scope == scope) || resultA.scope != scope) {
            throw Exception("Expected the same scope")
        }
        expect(resultA.resolvedType, "Int64")
        expect(resultA.id.value, "a")

        let unresolved = scope.lookup("zzz")
        if (unresolved.scope.isSome()) {
            throw Exception("Scope should be None for an unresolved result")
        }
        if (unresolved.resolvedType.isSome()) {
            throw Exception("Type should be None for an unresolved result")
        }
        expect(unresolved.id.value, "zzz")

        let invalid = scope.lookup("b")
        if (invalid.scope != scope) {
            throw Exception("Expected the same scope")
        }
        expect(invalid.id.value, "b")
        if (invalid.resolvedType.isSome()) {
            throw Exception("Type should be None for an invalid result")
        }
    }

    static func scopeOf(tokens: Tokens): Scope {
        let clazz = parseDecl(tokens) as ClassDecl ?? throw Exception()
        let scope = Scope(None, kind: ClassLikeScope)
        bodyDecl(clazz.body, scope)
        return scope
    }
}

class IntersectTests {
    func same(): Unit {
        for (input in [
                ("Int64", "Int64", "Int64"),
                ("Int64", "String", "Any"),
                ("Int64", "Nothing", "Int64"),
                ("Nothing", "Int64", "Int64"),
                ("Array<String>", "Array<String>", "Array<String>"),
                ("Array<String>", "Array<Int>", "Any"),
                ("(Int,Int)", "(Int,Int)", "(Int,Int)")
            ]) {
            let a = myParseType(cangjieLex(input[0]))
            let b = myParseType(cangjieLex(input[1]))
            let expected = input[2]

            let r = unionApprox(a, b)
            expect(r, expected)
        }
    }
}

func render(typeNode: TypeNode): String {
    typeNode.toTokens().toString().replace(" ", "")
}

func expect(typeNode: ?TypeNode, expected: String): Unit {
    let rendered = match (typeNode) {
        case Some(typeNode) => render(typeNode)
        case None => "?"
    }
    expect(rendered, expected)
}

func expect(actual: String, expected: String): Unit {
    if (expected != actual) {
        throw Exception("Expected ${expected}, got ${actual}")
    }
}

func expect(actual: ?String, expected: ?String): Unit {
    match ((actual, expected)) {
        case (Some(actual), Some(expected)) => expect(actual, expected)
        case (None, None) => ()
        case (Some(actual), None) => throw Exception("Expected None, got ${actual}")
        case (None, Some(expected)) => throw Exception("Expected ${expected}, got None")
    }
}

struct SubCase <: ToString {
    init(
        exprStr: String,
        expected: String
    ) {
        this(cangjieLex(exprStr), expected)
    }

    SubCase(
        let tokens: Tokens,
        let expected: String
    ) {
        exprStr = tokens.toString()
        expr = try {
            parseExpr(tokens)
        } catch (e: Exception) {
            throw Exception("Failed to parse ${exprStr}: ${e.message}")
        }
    }

    let expr: Expr
    let exprStr: String

    public func toString(): String {
        "(${exprStr}, exp: ${expected})"
    }
}

private func constExprTypeRoot(expr: Expr): ?TypeNode {
    constExprType(expr, Scope(None))
}

private func testCases(
    cases: Array<SubCase>,
    testBody: (SubCase) -> Unit
): Unit {
    let results = Strings()
    for (c in cases) {
        try {
            testBody(c)
            results.append(c.toString(), "[OK]")
        } catch (cause: Exception) {
            cause.printStackTrace()
            results.append(c.toString(), "[FAILED]")
        }
    }

    for (e in results) {
        println(e)
    }
}

// importing std.collection.ArrayList
// causes generic instatiation and packages import
// that surprisingly affects time cost
class Strings <: Iterable<String> {
    private var items = Array<String>(5, repeat: "")
    private var count = 0

    func append(name: String, status: String): Unit {
        append("${name}\t${status}")
    }

    func append(str: String): Unit {
        while (count >= items.size) {
            println("count = ${count}, items.size = ${items.size}")
            grow()
        }
        items[count] = str
        count++
    }

    public override func iterator() {
        items[0..count].iterator()
    }

    private func grow() {
        let newItems = Array<String>(items.size * 2, repeat: "")
        items.copyTo(newItems, 0, 0, items.size)
        this.items = newItems
    }
}

func myParseType(tokens: Tokens): TypeNode {
    let v = match (parseDecl(quote(let x: $tokens))) {
        case v: VarDecl => v
        case _ => throw Exception()
    }

    return v.declType
}
