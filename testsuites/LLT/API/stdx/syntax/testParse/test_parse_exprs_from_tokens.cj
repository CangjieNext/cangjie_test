/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.ArrayList

@Test
class Test {
    @TestCase
    func testArrayLiteralwithComment() {
        var tks = quote([1, 2, 3])
        tks.append(Token(TokenKind.COMMENT, "// this is ArrayLiteral"))
        let node = parseTokens(tks)
        let expr = (node.node.getOrThrow() as ArrayLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString().replace("\r\n", "\n"), "1")
        @Expect(expr.elements[1].toString().replace("\r\n", "\n"), "2")
        @Expect(expr.elements[2].toString().replace("\r\n", "\n"), "3")
        @Expect(expr.toString().replace("\r\n", "\n"), "[1, 2, 3] // this is ArrayLiteral")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 34]).toArray())
    }

    @TestCase
    func testInvalidPos() {
        let tks = quote([1, 2, 3])
        var tokens = Tokens()
        var i: UInt32 = 1
        for (tk in tks) {
            tokens.append(Token(tk.kind, tk.value).addPosition(i, Int32(i), 1))
            i += 1
        }
        try {
            var tks1 = tokens + Token(TokenKind.NL)
            parseTokens(tks1, refreshPos: false)
        } catch (e: Exception) {
            @Expect(e.message, "the position of the input tokens is invalid, you may open the refreshPos option.")
        }
        try {
            var tks2 = tokens + Token(TokenKind.NL).addPosition(1, 1, 1)
            parseTokens(tks2, refreshPos: false)
        } catch (e: Exception) {
            @Expect(e.message, "the position of the input tokens is invalid, you may open the refreshPos option.")
        }
    }

    @TestCase
    func testUnsupported() {
        try {
            parseTokens(quote(#"import std.collection.*"#))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type in parseTokens function."), true)
        }

        try {
            parseTokens(quote(@testMacro[public func](let a = 1)))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type in parseTokens function."), true)
        }

        try {
            parseTokens(quote(a?))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseTokens function:"), true)
        }

        try {
            parseTokens(quote( 1 + 1 : Int))
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseTokens function:"), true)
        }

        try {
            parseTokens(quote( 1 + 1
            1 + 1))
        } catch (e: Exception) {
            @Expect(e.message, "parseTokens function not support parse more than one node.")
        }
    }

    @TestCase
    func testArrayLiteral01() {
        let node = parseTokens(quote([1, 2, 3]))
        let expr = (node.node.getOrThrow() as ArrayLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString().replace("\r\n", "\n"), "1")
        @Expect(expr.elements[1].toString().replace("\r\n", "\n"), "2")
        @Expect(expr.elements[2].toString().replace("\r\n", "\n"), "3")
        @Expect(expr.toString().replace("\r\n", "\n"), "[1, 2, 3]")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 10]).toArray())
    }

    @TestCase
    func testLitConstStrExpr() {
        let node = parseTokens(quote("hello"))
        let res = (node.node.getOrThrow() as LitConstStrExpr).getOrThrow()
        @Expect(res.rawValue, 'hello')
        @Expect(res.toString().replace("\r\n", "\n"), '"hello"')
        @Expect(node.diags.size, 0)
        @Expect(res.parentNode.isNone(), true)
        var pos = res.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 8]).toArray())

        let node1 = parseTokens(quote("${x}"))
        var litconststrexpr_1 = (node1.node.getOrThrow() as LitConstStrExpr).getOrThrow()
        @Assert(litconststrexpr_1.toString().replace("\r\n", "\n"), ##""${x}""##)
        @Expect(litconststrexpr_1.rawValue, ##"${x}"##)
        @Assert(litconststrexpr_1.strPartExprs.size, 1)
        match(litconststrexpr_1.strPartExprs[0]){
            case StrLiteralPart.StrInterpolation(strInterpolationContent) => @Assert(strInterpolationContent.toString().replace("\r\n", "\n"), ##"${x}"##)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testStrInterpolation() {
        let strExpr = (parseTokens(quote("${a.toString()}abc")).node.getOrThrow() as LitConstStrExpr).getOrThrow()
        match(strExpr.strPartExprs[0]) {
            case StrInterpolation(v) => @Expect(v.interpolationBlock.toString().replace("\r\n", "\n"), "{a.toString()}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(strExpr.toString().replace("\r\n", "\n"), #""${a.toString()}abc""#)
    }

    @TestCase
    func testLitConstExpr01() {
        let node = parseTokens(quote(r"a"))
        let expr = (node.node.getOrThrow() as LitConstRuneExpr).getOrThrow()
        @Expect(expr.rawValue, "a")
        @Expect(expr.isSingleQuote, false)
        @Expect(expr.toString().replace("\r\n", "\n"), #"r"a""#)
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())

        let expr1 = (parseTokens(quote((     ))).node.getOrThrow() as LitConstExpr).getOrThrow()
        match (expr1.kind) {
            case LitConstKind.UnitLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr1.rawValue, "()")
        @Expect(expr1.toString().replace("\r\n", "\n"), "()")
    }

    @TestCase
    func testBinaryExpr01() {
        let node = parseTokens(quote(a + b))
        let expr = (node.node.getOrThrow() as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Add => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "a + b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 4]).toArray())
    }

    @TestCase
    func testAsExpr01() {
        let node = parseTokens(quote(a as String))
        let expr = (node.node.getOrThrow() as AsExpr).getOrThrow()
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "a")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as CompositeType).getOrThrow()
        match (targetType.name) {
            case "String" => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "a as String")
    }

    @TestCase
    func testAssignExpr02() {
        let node = parseTokens(quote(c += b))
        let expr = (node.node.getOrThrow() as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.AddAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "c")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString().replace("\r\n", "\n"), "c += b")
    }

    @TestCase
    func testBreakAndContinueExpr() {
        var node = parseTokens(quote(break))
        var expr = (node.node.getOrThrow() as BreakExpr).getOrThrow()
        @Expect(expr.toString().replace("\r\n", "\n"), "break")
        node = parseTokens(quote(continue))
        let expr1 = (node.node.getOrThrow() as ContinueExpr).getOrThrow()
        @Expect(expr1.toString().replace("\r\n", "\n"), "continue")
    }

    @TestCase
    func testCallExpr02() {
        let node = parseTokens(quote(foo1("a", "b", isEmpty: true, inout a)))
        let expr = (node.node.getOrThrow() as CallExpr).getOrThrow()
        @Expect(expr.callee.toString().replace("\r\n", "\n"), "foo1")
        @Expect(expr.arguments.size, 4)

        let arg0 = (expr.arguments[0].value as LitConstExpr).getOrThrow()
        let arg1 = (expr.arguments[1].value as LitConstExpr).getOrThrow()
        let arg2 = (expr.arguments[2].value as LitConstExpr).getOrThrow()
        @Expect(arg0.rawValue, "a")
        @Expect(arg1.rawValue, "b")
        @Expect(arg2.rawValue, "true")
        @Expect(expr.toString().replace("\r\n", "\n"), #"foo1("a", "b", isEmpty: true, inout a)"#)
    }

    @TestCase
    func testDisjunctionCond() {
        let node = parseTokens(quote(if (a == b && let c <- b && c == a && true) {}))
        let expr = (node.node.getOrThrow() as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString().replace("\r\n", "\n"), ##"a == b && let c <- b && c == a && true"##)
        @Expect(condition.cond.size, 1)
        @Assert(condition.cond[0].toString().replace("\r\n", "\n"), ##"a == b && let c <- b && c == a && true"##)
    }

    @TestCase
    func testDoWhileExpr02() {
        let tokens = quote(
do {
        println()
        return
    } while (x && y + 1 > 3))
        let node = parseTokens(tokens)
        let expr = (node.node.getOrThrow() as DoWhileExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 3")
        @Expect(expr.body.toString().replace("\r\n", "\n"), """
{
    println()
    return
}""")
        @Expect(expr.toString().replace("\r\n", "\n"), """
do {
    println()
    return
} while(x && y + 1 > 3)""")
        var pos = expr.getDoKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 3]).toArray())
        pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 3, 4, 8]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 8, 4, 9]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 23, 4, 24]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 4, 24]).toArray())
    }

    @TestCase
    func testForInExpr01() {
        let node = parseTokens(quote(for ((x, y) in array) {}))
        let expr = (node.node.getOrThrow() as ForInExpr).getOrThrow()
        @Expect(expr.pattern.toString().replace("\r\n", "\n"), "(x, y)")
        @Expect(expr.expr.toString().replace("\r\n", "\n"), "array")
        @Expect(expr.body.toString().replace("\r\n", "\n"), "{ }")
        @Expect(expr.patternGuard.isNone())
        @Expect(expr.toString().replace("\r\n", "\n"), "for((x, y) in array) { }")
    }

    @TestCase
    func testIfExpr03() {
        let tokens = quote(
if (x && y + 1 > 2) {
    println()
} else if (let Some(f) <- d && f > 3) {
    println()
} else if (let Some(_) <- a || let Some(_) <- d) {
    return
} else {
    return
})
        let node = parseTokens(tokens)
        let expr = (node.node.getOrThrow() as IfExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 2")
        @Expect(expr.ifBlock.toString().replace("\r\n", "\n"), """
{
    println()
}""")
        @Expect(expr.elseBlock.isNone())

        let elseIf = expr.elseIf.getOrThrow()
        @Expect(elseIf.condition.toString().replace("\r\n", "\n"), "let Some(f) <- d && f > 3")
        @Expect(elseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
    println()
}""")
        @Expect(elseIf.elseBlock.isNone())

        let elseElseIf = elseIf.elseIf.getOrThrow()
        @Expect(elseElseIf.condition.toString().replace("\r\n", "\n"), "let Some(_) <- a || let Some(_) <- d")
        @Expect(elseElseIf.ifBlock.toString().replace("\r\n", "\n"), """
{
    return
}""")
        if (let Some(elseBlock) <- elseElseIf.elseBlock) {
            @Expect(elseBlock.toString().replace("\r\n", "\n"), """
{
    return
}""")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), """
if(x && y + 1 > 2) {
    println()
} else if(let Some(f) <- d && f > 3) {
    println()
} else if(let Some(_) <- a || let Some(_) <- d) {
    return
} else {
    return
}""")
    }

    @TestCase
    func testIncOrDecExpr01() {
        let node = parseTokens(quote(a++))
        let expr = (node.node.getOrThrow() as IncOrDecExpr).getOrThrow()
        @Expect(expr.operand.toString().replace("\r\n", "\n"), "a")
        match (expr.kind) {
            case IncOrDecOpKind.Incr => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "a ++")
    }

    @TestCase
    func testIsExpr02() {
        let node = parseTokens(quote(b is Int64))
        let expr = (node.node.getOrThrow() as IsExpr).getOrThrow()
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "b")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "b is Int64")
    }

    @TestCase
    func testLambda03() {
        let node = parseTokens(quote({ a: (Int64, (Int64)), b: A => let c = a * b
                                   return c }))
        let expr = (node.node.getOrThrow() as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.params.size, 2)
        @Expect(params.toString().replace("\r\n", "\n"), "a:(Int64,(Int64)), b: A")
        @Expect(params.params[0].toString().replace("\r\n", "\n"), "a:(Int64,(Int64))")
        @Expect(params.params[1].toString().replace("\r\n", "\n"), "b: A")
        @Expect(expr.body.size, 2)
        @Expect(expr.body[0].toString().replace("\r\n", "\n"), "let c = a * b")
        @Expect(expr.body[1].toString().replace("\r\n", "\n"), "return c")
        @Expect(expr.toString().replace("\r\n", "\n"), #"{ a:(Int64,(Int64)), b: A => let c = a * b
return c }"#)
    }

    @TestCase
    func testMatchExpr02() {
        let tokens = quote(
match (a) {
        case v: Int64 => ()
        case 1.1 | 2.2 => ()
        case b where true => ()
        case _: T => { => }
        case _ => ()
    })
        let node = parseTokens(tokens)
        let expr = (node.node.getOrThrow()  as MatchExpr).getOrThrow()
        let selector = expr.selector.getOrThrow()
        @Expect(selector.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.matchCases.size, 5)
        @Expect(expr.matchCases[0].toString().replace("\r\n", "\n"), "case v: Int64 =>()")
        @Expect(expr.matchCases[1].toString().replace("\r\n", "\n"), "case 1.1 | 2.2 =>()")
        @Expect(expr.matchCases[2].toString().replace("\r\n", "\n"), "case b where true =>()")
        @Expect(expr.matchCases[3].toString().replace("\r\n", "\n"), "case _: T => { => }")
        @Expect(expr.matchCases[4].toString().replace("\r\n", "\n"), "case _ =>()")

        @Expect(expr.toString().replace("\r\n", "\n"), """
match(a) {
    case v: Int64 =>()
    case 1.1 | 2.2 =>()
    case b where true =>()
    case _: T => { => }
    case _ =>()
}""")
    }

    @TestCase
    func testMemberAccess01() {
        let node = parseTokens(quote(A.a))
        let expr = (node.node.getOrThrow() as MemberAccess).getOrThrow()
        @Expect(expr.base.toString().replace("\r\n", "\n"), "A")
        @Expect(expr.field.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.toString().replace("\r\n", "\n"), "A.a")
    }

    @TestCase
    func testOptionalExpr01() {
        let node = parseTokens(quote(a?()))
        let callExpr = (node.node.getOrThrow() as CallExpr).getOrThrow()
        let expr = (callExpr.callee as OptionalExpr).getOrThrow()
        @Expect(expr.base.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.toString().replace("\r\n", "\n"), "a?")
    }

    @TestCase
    func testParenExpr01() {
        let node = parseTokens(quote((a + b)))
        let expr = (node.node.getOrThrow() as ParenExpr).getOrThrow()
        @Expect(expr.subExpr.toString().replace("\r\n", "\n"), "a + b")
        @Expect(expr.toString().replace("\r\n", "\n"), "(a + b)")
    }

    @TestCase
    func testQuoteExpr() {
        let expr = (parseTokens(quote(quote   (()))).node.getOrThrow() as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString().replace("\r\n", "\n"), #"()"#)
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), #"quote(())"#)
    }

    @TestCase
    func testRangeExpr01() {
        let expr = (parseTokens(quote(1..100:2)).node.getOrThrow() as RangeExpr).getOrThrow()
        match (expr.kind) {
            case RangeKind.RangeOp => ()
            case _ => @FailExpect("kind wrong")
        }
        let startEx = (expr.start.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(startEx.rawValue, "1")
        let endEx = (expr.end.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(endEx.rawValue, "100")
        let stepEx = (expr.step.getOrThrow() as LitConstExpr).getOrThrow()
        @Expect(stepEx.rawValue, "2")
        @Expect(expr.toString().replace("\r\n", "\n"), "1 .. 100: 2")
    }

    @TestCase
    func testReturnExpr01() {
        let expr = (parseTokens(quote(return 1)).node.getOrThrow() as ReturnExpr).getOrThrow()
        @Expect(expr.retVal.getOrThrow().toString().replace("\r\n", "\n"), "1")
        @Expect(expr.toString().replace("\r\n", "\n"), "return 1")
    }

    @TestCase
    func testSpawnExpr01() {
        let tokens = quote(
spawn { =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    })
        let expr = (parseTokens(tokens).node.getOrThrow() as SpawnExpr).getOrThrow()
        @Expect(expr.threadContext.isNone())
        @Expect(expr.trailingLambdaExpr.toString().replace("\r\n", "\n"), """
{ =>
    println("New thread before sleeping")
    sleep(100 * Duration.millisecond)
    println("New thread after sleeping")
}""")
        @Expect(expr.toString().replace("\r\n", "\n"), """
spawn { =>
    println("New thread before sleeping")
    sleep(100 * Duration.millisecond)
    println("New thread after sleeping")
}""")
    }

    @TestCase
    func testSubscriptExpr02() {
        let expr = (parseTokens(quote(a[x][b.c[1]])).node.getOrThrow() as SubscriptExpr).getOrThrow()
        let base = (expr.base as SubscriptExpr).getOrThrow()
        let index = (expr.indexs[0] as SubscriptExpr).getOrThrow()
        @Expect(base.toString().replace("\r\n", "\n"), "a[x]")
        @Expect(expr.indexs.size, 1)
        @Expect(expr.indexs[0].toString().replace("\r\n", "\n"), "b.c[1]")
        @Expect(index.base is MemberAccess)
        @Expect(index.base.toString().replace("\r\n", "\n"), "b.c")
        @Expect(expr.toString().replace("\r\n", "\n"), "a[x][b.c[1]]")

        let expr1 = (parseTokens(quote(a[0, 1, 2])).node.getOrThrow() as SubscriptExpr).getOrThrow()
        @Expect(expr1.toString().replace("\r\n", "\n"), "a[0, 1, 2]")
    }

    @TestCase
    func testSynchoronizedExpr01() {
        let tokens = quote(
synchronized (obj) {
        while (true) {
            obj.wait()
        }
    })
        let expr = (parseTokens(tokens).node.getOrThrow() as SynchronizedExpr).getOrThrow()
        @Expect(expr.structuredMutex.toString().replace("\r\n", "\n"), "obj")
        @Expect(expr.block.toString().replace("\r\n", "\n"), """
{
    while(true) {
        obj.wait()
    }
}""")
        @Expect(expr.toString().replace("\r\n", "\n"), """
synchronized(obj) {
    while(true) {
        obj.wait()
    }
}""")
    }

    @TestCase
    func testThrowExpr03() {
        let tokens = quote(throw Exception("\${Exception(a.b)}"))
        let expr = (parseTokens(tokens).node.getOrThrow() as ThrowExpr).getOrThrow()
        @Expect(expr.throwVal.toString().replace("\r\n", "\n"), #'Exception("\${Exception(a.b)}")'#)
        @Expect(expr.toString().replace("\r\n", "\n"), #'throw Exception("\${Exception(a.b)}")'#)
    }

    @TestCase
    func testTrailingClosureExpr02() {
        let tokens = quote(f(1, "") { a: Int64 => return a})
        let expr = (parseTokens(tokens).node.getOrThrow() as TrailingClosureExpr).getOrThrow()
        @Expect(expr.toString().replace("\r\n", "\n"), 'f(1, "") { a: Int64 => return a }')
        @Expect(expr.arguments.size, 2)
        @Expect(expr.arguments[0].toString().replace("\r\n", "\n"), "1")
        @Expect(expr.arguments[1].toString().replace("\r\n", "\n"), '""')
        let callee = (expr.callee as SymbolRef).getOrThrow()
        @Expect(callee.toString().replace("\r\n", "\n"), "f")
    }

    @TestCase
    func testTryCatch04() {
        let tokens = quote(try {
        a
    } catch (e: Exception | IOException) {
        b
    } catch (_) {
        c
    })
        let expr = (parseTokens(tokens).node.getOrThrow() as TryCatch).getOrThrow()
        @Expect(expr.toString().replace("\r\n", "\n"), #"try {
    a
} catch(e: Exception | IOException) {
    b
} catch(_) {
    c
}"#)
        @Expect(expr.tryBlock.toString().replace("\r\n", "\n"), ##"{
    a
}"##)
        @Expect(expr.catchBlocks.size, 2)
        @Expect(expr.catchBlocks[0].toString().replace("\r\n", "\n"), ##"{
    b
}"##)
        @Expect(expr.catchBlocks[1].toString().replace("\r\n", "\n"), ##"{
    c
}"##)
        @Expect(expr.catchPatterns.size, 2)
        @Expect(expr.catchPatterns[0].toString().replace("\r\n", "\n"), "e: Exception | IOException")
        @Expect(expr.catchPatterns[1].toString().replace("\r\n", "\n"), "_")
        @Expect(expr.finallyBlock.isNone())
        @Expect(expr.resourceSpec.size, 0)
    }

    @TestCase
    func testTupleLiteral01() {
        let expr = (parseTokens(quote((1, 2, 3))).node.getOrThrow() as TupleLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString().replace("\r\n", "\n"), "1")
        @Expect(expr.elements[1].toString().replace("\r\n", "\n"), "2")
        @Expect(expr.elements[2].toString().replace("\r\n", "\n"), "3")
        @Expect(expr.toString().replace("\r\n", "\n"), "(1, 2, 3)")
    }

    @TestCase
    func testTypeConvExpr01() {
        let expr = (parseTokens(quote(Int8(32))).node.getOrThrow() as TypeConvExpr).getOrThrow()
        @Expect(expr.srcVal.toString().replace("\r\n", "\n"), "32")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int8Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString().replace("\r\n", "\n"), "Int8(32)")
    }

    @TestCase
    func testUnaryExpr01() {
        let expr = (parseTokens(quote(!a)).node.getOrThrow() as UnaryExpr).getOrThrow()
        match (expr.opKind) {
            case UnaryOpKind.Not => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.operand.toString().replace("\r\n", "\n"), "a")
        @Expect(expr.toString().replace("\r\n", "\n"), "! a")
    }

    @TestCase
    func testUnsafeExpr01() {
        let tokens = quote(unsafe { data.rawData() })
        var expr = (parseTokens(tokens).node.getOrThrow() as UnsafeExpr).getOrThrow()
        @Expect(expr.toString().replace("\r\n", "\n"), "unsafe { data.rawData() }")
        @Expect(expr.block.toString().replace("\r\n", "\n"), "{ data.rawData() }")
    }

    @TestCase
    func testWhileExpr02() {
        let tokens = quote(
while (x && y + 1 > 3) {
        println()
        return
    })
        let expr = (parseTokens(tokens).node.getOrThrow() as WhileExpr).getOrThrow()
        @Expect(expr.condition.toString().replace("\r\n", "\n"), "x && y + 1 > 3")
        @Expect(expr.body.toString().replace("\r\n", "\n"), """
{
    println()
    return
}""")
        @Expect(expr.toString().replace("\r\n", "\n"), """
while(x && y + 1 > 3) {
    println()
    return
}""")
    }
}

