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
    func testIfExprWithTrailingSpace() {
        let text = """
if (x && y + 1 > 2) {  
        println()  
    }"""
        let node = parseText(text).node.getOrThrow()
        let expr = (node as IfExpr).getOrThrow()

        @Expect(expr.toString(), """
if (x && y + 1 > 2) {
        println()
    }""")
    }

    @TestCase
    func notSupport() {
        try {
            parseText(#"import std.collection.*"#)
        } catch (e: Exception) {
            @Expect(e.message, "unsupported node type in parseText function.")
        }

        try {
            parseText("@testMacro[public func](let a = 1)")
        } catch (e: Exception) {
            @Expect(e.message, "unsupported node type in parseText function.")
        }

        try {
            parseText("a?")
        } catch (e: Exception) {
            @Expect(e.message, #"unsupported node type or parse error in parseText function:
expected '.', '(', '[', '{' or '?' after '?'
 ==> :1:2:

expected expression after '?', found '<EOF>'
 ==> :1:3:

"#)
        }

        try {
            parseText("( 1+1")
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseText function:"))
        }

        try {
            parseText("1+1  :Int")
        } catch (e: Exception) {
            @Expect(e.message.contains("unsupported node type or parse error in parseText function:"))
        }

        try {
            parseText(#"   1 + 1
         1+1 "#)
        } catch (e: Exception) {
            @Expect(e.message, "parseText function not support parse more than one node.")
        }
    }

    @TestCase
    func testTrailingWhiteSpace() {
        let node = parseText(#"    
        
    'hello'    
    
    ;   ; "#)
        let res = (node.node.getOrThrow() as LitConstStrExpr).getOrThrow()
        @Expect(res.rawValue, 'hello')
        @Expect(res.toString(), #"    
        
    'hello'"#)
        @Expect(node.diags.size, 0)
        @Expect(res.parentNode.isNone(), true)
        var pos = res.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 12]).toArray())
    }

    @TestCase
    func testLitConstStrExpr() {
        let node = parseText(#"    
        
    'hello'"#)
        let res = (node.node.getOrThrow() as LitConstStrExpr).getOrThrow()
        @Expect(res.rawValue, 'hello')
        @Expect(res.toString(), #"    
        
    'hello'"#)
        @Expect(node.diags.size, 0)
        @Expect(res.parentNode.isNone(), true)
        var pos = res.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 5, 3, 12]).toArray())

        let node1 = parseText(#""${x}""#)
        var litconststrexpr_1 = (node1.node.getOrThrow() as LitConstStrExpr).getOrThrow()
        @Assert(litconststrexpr_1.toString(), #""${x}""#)
        @Expect(litconststrexpr_1.rawValue, #"${x}"#)
        @Assert(litconststrexpr_1.strPartExprs.size, 1)
        match(litconststrexpr_1.strPartExprs[0]){
            case StrLiteralPart.StrInterpolation(strInterpolationContent) => @Assert(strInterpolationContent.toString(), #"${x}"#)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testStrInterpolation() {
        let strExpr = (parseText(#""${a.toString()}abc""#).node.getOrThrow() as LitConstStrExpr).getOrThrow()
        match(strExpr.strPartExprs[0]) {
            case StrInterpolation(v) => @Expect(v.interpolationBlock.toString(), "{a.toString()}")
            case _ => @FailExpect("kind wrong")
        }
        @Expect(strExpr.toString(), #""${a.toString()}abc""#)
    }

    @TestCase
    func testLitConstExpr01() {
        let node = parseText("r'a'")
        let expr = (node.node.getOrThrow() as LitConstRuneExpr).getOrThrow()
        @Expect(expr.rawValue, "a")
        @Expect(expr.isSingleQuote, true)
        @Expect(expr.toString(), "r'a'")
        let pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 5]).toArray())

        let expr1 = (parseText("   (     )").node.getOrThrow() as LitConstExpr).getOrThrow()
        match (expr1.kind) {
            case LitConstKind.UnitLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr1.rawValue, "(     )")
        @Expect(expr1.toString(), "   (     )")

        let expr2 = (parseText("   12").node.getOrThrow() as LitConstExpr).getOrThrow()
        match (expr2.kind) {
            case LitConstKind.IntergerLiteral => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr2.rawValue, "12")
        @Expect(expr2.toString(), "   12")
    }

    @TestCase
    func testBinaryExpr01() {
        let node = parseText("a + b")
        let expr = (node.node.getOrThrow() as BinaryExpr).getOrThrow()
        match (expr.opKind) {
            case BinaryOpKind.Add => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "a")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "a + b")

        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 6]).toArray())
        pos = expr.getOperatorPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 3, 1, 4]).toArray())
    }

    @TestCase
    func testArrayLiteral01() {
        let node = parseText("   [1, 2, 3]")
        let expr = (node.node.getOrThrow() as ArrayLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString(), "1")
        @Expect(expr.elements[1].toString(), "2")
        @Expect(expr.elements[2].toString(), "3")
        @Expect(expr.toString(), "   [1, 2, 3]")
        var pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 4, 1, 13]).toArray())
    }

    @TestCase
    func testAsExpr01() {
        let node = parseText("a as String")
        let expr = (node.node.getOrThrow() as AsExpr).getOrThrow()
        @Expect(expr.srcVal.toString(), "a")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as CompositeType).getOrThrow()
        match (targetType.name) {
            case "String" => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "a as String")
    }

    @TestCase
    func testAssignExpr02() {
        let node = parseText("c += b")
        let expr = (node.node.getOrThrow() as AssignExpr).getOrThrow()
        match (expr.assignOpKind) {
            case AssignOpKind.AddAssign => ()
            case _ => @FailExpect("kind wrong")
        }
        let lexpr = (expr.lhs as SymbolRef).getOrThrow()
        @Expect(lexpr.name, "c")
        let rexpr = (expr.rhs as SymbolRef).getOrThrow()
        @Expect(rexpr.name, "b")
        @Expect(expr.toString(), "c += b")
    }

    @TestCase
    func testBreakAndContinueExpr() {
        var node = parseText("break")
        var expr = (node.node.getOrThrow() as BreakExpr).getOrThrow()
        @Expect(expr.toString(), "break")
        node = parseText("continue")
        let expr1 = (node.node.getOrThrow() as ContinueExpr).getOrThrow()
        @Expect(expr1.toString(), "continue")
    }

    @TestCase
    func testCallExpr02() {
        let node = parseText(#"foo1("a", "b", isEmpty: true, inout a)"#)
        let expr = (node.node.getOrThrow() as CallExpr).getOrThrow()
        @Expect(expr.callee.toString(), "foo1")
        @Expect(expr.arguments.size, 4)

        let arg0 = (expr.arguments[0].value as LitConstExpr).getOrThrow()
        let arg1 = (expr.arguments[1].value as LitConstExpr).getOrThrow()
        let arg2 = (expr.arguments[2].value as LitConstExpr).getOrThrow()
        @Expect(arg0.rawValue, "a")
        @Expect(arg1.rawValue, "b")
        @Expect(arg2.rawValue, "true")
        @Expect(expr.toString(), #"foo1("a", "b", isEmpty: true, inout a)"#)
    }

    @TestCase
    func testDisjunctionCond() {
        let node = parseText("if (a == b && let c <- b && c == a && true) {}")
        let expr = (node.node.getOrThrow() as IfExpr).getOrThrow()
        let condition = expr.condition

        @Assert(condition.toString(), ##"a == b && let c <- b && c == a && true"##)
        @Expect(condition.cond.size, 1)
        @Assert(condition.cond[0].toString(), ##"a == b && let c <- b && c == a && true"##)
    }

    @TestCase
    func testDoWhileExpr02() {
        let rawString = """
do {
        println()
        return
    } while (x && y + 1 > 3)"""
        let node = parseText(rawString)
        let expr = (node.node.getOrThrow() as DoWhileExpr).getOrThrow()
        @Expect(expr.condition.toString(), "x && y + 1 > 3")
        @Expect(expr.body.toString(), """
{
        println()
        return
    }""")
        @Expect(expr.toString(), rawString)
        var pos = expr.getDoKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 3]).toArray())
        pos = expr.getWhileKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 7, 4, 12]).toArray())
        pos = expr.getCondLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 13, 4, 14]).toArray())
        pos = expr.getCondRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 28, 4, 29]).toArray())
        pos = expr.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 4, 29]).toArray())
    }

    @TestCase
    func testForInExpr01() {
        let node = parseText("for ((x, y) in array) {}")
        let expr = (node.node.getOrThrow() as ForInExpr).getOrThrow()
        @Expect(expr.pattern.toString(), "(x, y)")
        @Expect(expr.expr.toString(), "array")
        @Expect(expr.body.toString(), "{}")
        @Expect(expr.patternGuard.isNone())
        @Expect(expr.toString(), "for ((x, y) in array) {}")
    }

    @TestCase
    func testIfExpr03() {
        let text = """
if (x && y + 1 > 2) {
        println()
    } else if (let Some(f) <- d && f > 3) {
        println()
    } else if (let Some(_) <- a || let Some(_) <- d) {
        return
    } else {
        return
    }"""
        let node = parseText(text)
        let expr = (node.node.getOrThrow() as IfExpr).getOrThrow()
        @Expect(expr.condition.toString(), "x && y + 1 > 2")
        @Expect(expr.ifBlock.toString(), """
{
        println()
    }""")
        @Expect(expr.elseBlock.isNone())

        let elseIf = expr.elseIf.getOrThrow()
        @Expect(elseIf.condition.toString(), "let Some(f) <- d && f > 3")
        @Expect(elseIf.ifBlock.toString(), """
{
        println()
    }""")
        @Expect(elseIf.elseBlock.isNone())

        let elseElseIf = elseIf.elseIf.getOrThrow()
        @Expect(elseElseIf.condition.toString(), "let Some(_) <- a || let Some(_) <- d")
        @Expect(elseElseIf.ifBlock.toString(), """
{
        return
    }""")
        if (let Some(elseBlock) <- elseElseIf.elseBlock) {
            @Expect(elseBlock.toString(), """
{
        return
    }""")
        }
        @Expect(expr.toString(), text)
    }

    @TestCase
    func testIncOrDecExpr01() {
        let node = parseText("a++")
        let expr = (node.node.getOrThrow() as IncOrDecExpr).getOrThrow()
        @Expect(expr.operand.toString(), "a")
        match (expr.kind) {
            case IncOrDecOpKind.Incr => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "a++")
    }

    @TestCase
    func testIsExpr02() {
        let node = parseText("b is Int64")
        let expr = (node.node.getOrThrow() as IsExpr).getOrThrow()
        @Expect(expr.srcVal.toString(), "b")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "b is Int64")
    }

    @TestCase
    func testLambda03() {
        let node = parseText(#"{ a: (Int64, (Int64)), b: A => let c = a * b
                                   return c }"#)
        let expr = (node.node.getOrThrow() as Lambda).getOrThrow()
        let params = expr.params
        @Expect(params.params.size, 2)
        @Expect(params.toString(), "a: (Int64, (Int64)), b: A")
        @Expect(params.params[0].toString(), "a: (Int64, (Int64))")
        @Expect(params.params[1].toString(), "b: A")
        @Expect(expr.body.size, 2)
        @Expect(expr.body[0].toString(), "let c = a * b")
        @Expect(expr.body[1].toString(), "return c")
        @Expect(expr.toString(), #"{ a: (Int64, (Int64)), b: A => let c = a * b
                                   return c }"#)
    }

    @TestCase
    func testMatchExpr02() {
        let text = """
match(a) {
        case v: Int64 => ()
        case 1.1 | 2.2 => ()
        case b where true => ()
        case _: T => { => }
        case _ => ()
    }"""
        let node = parseText(text)
        let expr = (node.node.getOrThrow()  as MatchExpr).getOrThrow()
        let selector = expr.selector.getOrThrow()
        @Expect(selector.toString(), "a")
        @Expect(expr.matchCases.size, 5)
        @Expect(expr.matchCases[0].toString(), "case v: Int64 => ()")
        @Expect(expr.matchCases[1].toString(), "case 1.1 | 2.2 => ()")
        @Expect(expr.matchCases[2].toString(), "case b where true => ()")
        @Expect(expr.matchCases[3].toString(), "case _: T => { => }")
        @Expect(expr.matchCases[4].toString(), "case _ => ()")

        @Expect(expr.toString(), text)
    }

    @TestCase
    func testMemberAccess01() {
        let node = parseText("A.a")
        let expr = (node.node.getOrThrow() as MemberAccess).getOrThrow()
        @Expect(expr.base.toString(), "A")
        @Expect(expr.field.toString(), "a")
        @Expect(expr.toString(), "A.a")
    }

    @TestCase
    func testOptionalExpr01() {
        let node = parseText("a?()")
        let callExpr = (node.node.getOrThrow() as CallExpr).getOrThrow()
        let expr = (callExpr.callee as OptionalExpr).getOrThrow()
        @Expect(expr.base.toString(), "a")
        @Expect(expr.toString(), "a?")
    }

    @TestCase
    func testParenExpr01() {
        let node = parseText("(a + b)")
        let expr = (node.node.getOrThrow() as ParenExpr).getOrThrow()
        @Expect(expr.subExpr.toString(), "a + b")
        @Expect(expr.toString(), "(a + b)")
    }

    @TestCase
    func testQuoteExpr() {
        var expr_4: QuoteExpr = (parseText(##"quote($(quote($t)))"##).node.getOrThrow() as QuoteExpr).getOrThrow()
        @Assert(expr_4.toString(), ##"quote($(quote($t)))"##)
        @Assert(expr_4.tokensOrRefExpr.size, 1)
        match(expr_4.tokensOrRefExpr[0]) {
            case QuoteInterpolation(QuoteInterpolationExpr) => 
                @Assert(QuoteInterpolationExpr.toString(), ##"$(quote($t))"##)
                @Assert(QuoteInterpolationExpr.expr.toString(), ##"quote($t)"##)
            case _ => @Assert(false)
        }

        var text = ##"public macro Prop(input:Tokens):Tokens {
    let v = parseDecl(input)
    @getIdent[ident](input)
    return quote(
        $(input)
        public prop $(ident): $(decl.declType) {
            get() {
                this.$(v.identifier)
            }
        }
    )
}"##
        let quoteExpr = parseText(text).node.getOrThrow()
        @Expect(quoteExpr.toString().contains(text))

        text = ##"quote(     arr =      $(intList)
    x = $(float)
    s = $(str)
)"##
        expr_4 = (parseText(text).node.getOrThrow() as QuoteExpr).getOrThrow()
        @Expect(expr_4.toString(), text)
        @Expect(expr_4.tokensOrRefExpr.size, 7)
        match(expr_4.tokensOrRefExpr[0]) {
            case TokenPart(QuoteToken) => 
                @Expect(QuoteToken.toString(), ##"arr ="##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[1]) {
            case QuoteInterpolation(QuoteInterpolationExpr) => 
                @Assert(QuoteInterpolationExpr.toString(), ##"$(intList)"##)
                @Assert(QuoteInterpolationExpr.expr.toString(), ##"intList"##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[2]) {
            case TokenPart(QuoteToken) => 
                @Expect(QuoteToken.toString(), ##"
    x ="##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[3]) {
            case QuoteInterpolation(QuoteInterpolationExpr) => 
                @Assert(QuoteInterpolationExpr.toString(), ##"$(float)"##)
                @Assert(QuoteInterpolationExpr.expr.toString(), ##"float"##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[4]) {
            case TokenPart(QuoteToken) => 
                @Expect(QuoteToken.toString(), ##"
    s ="##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[5]) {
            case QuoteInterpolation(QuoteInterpolationExpr) => 
                @Assert(QuoteInterpolationExpr.toString(), ##"$(str)"##)
                @Assert(QuoteInterpolationExpr.expr.toString(), ##"str"##)
            case _ => @Assert(false)
        }
        match(expr_4.tokensOrRefExpr[6]) {
            case TokenPart(QuoteToken) => 
                @Expect(QuoteToken.toString(), ##"
"##)
            case _ => @Assert(false)
        }

        let expr = (parseText(#"quote   (\(\))"#).node.getOrThrow() as QuoteExpr).getOrThrow()
        @Expect(expr.tokensOrRefExpr.size, 1)
        match(expr.tokensOrRefExpr[0]) {
            case TokenPart(v) => @Expect(v.toString(), #"\(\)"#)
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), #"quote   (\(\))"#)
    }

    @TestCase
    func testRangeExpr01() {
        let expr = (parseText("1..100:2").node.getOrThrow() as RangeExpr).getOrThrow()
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
        @Expect(expr.toString(), "1..100:2")
    }

    @TestCase
    func testReturnExpr01() {
        let expr = (parseText("return 1").node.getOrThrow() as ReturnExpr).getOrThrow()
        @Expect(expr.retVal.getOrThrow().toString(), "1")
        @Expect(expr.toString(), "return 1")
    }

    @TestCase
    func testSpawnExpr01() {
        let text = """
spawn { =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    }"""
        let expr = (parseText(text).node.getOrThrow() as SpawnExpr).getOrThrow()
        @Expect(expr.threadContext.isNone())
        @Expect(expr.trailingLambdaExpr.toString(), """
{ =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    }""")
        @Expect(expr.toString(), text)
    }

    @TestCase
    func testSubscriptExpr02() {
        let expr = (parseText("a[x][b.c[1]]").node.getOrThrow() as SubscriptExpr).getOrThrow()
        let base = (expr.base as SubscriptExpr).getOrThrow()
        let index = (expr.indexs[0] as SubscriptExpr).getOrThrow()
        @Expect(base.toString(), "a[x]")
        @Expect(expr.indexs.size, 1)
        @Expect(expr.indexs[0].toString(), "b.c[1]")
        @Expect(index.base is MemberAccess)
        @Expect(index.base.toString(), "b.c")
        @Expect(expr.toString(), "a[x][b.c[1]]")

        let expr1 = (parseText("a[0, 1, 2]").node.getOrThrow() as SubscriptExpr).getOrThrow()
        @Expect(expr1.toString(), "a[0, 1, 2]")
    }

    @TestCase
    func testSynchoronizedExpr01() {
        let text = """
synchronized (obj) {
        while (true) {
            obj.wait()
        }
    }"""
        let expr = (parseText(text).node.getOrThrow() as SynchronizedExpr).getOrThrow()
        @Expect(expr.structuredMutex.toString(), "obj")
        @Expect(expr.block.toString(), """
{
        while (true) {
            obj.wait()
        }
    }""")
        @Expect(expr.toString(), text)
    }

    @TestCase
    func testThrowExpr03() {
        let text = "throw Exception(\"\${Exception(a.b)}\")"
        let expr = (parseText(text).node.getOrThrow() as ThrowExpr).getOrThrow()
        @Expect(expr.throwVal.toString(), "Exception(\"\${Exception(a.b)}\")")
        @Expect(expr.toString(), text)
    }

    @TestCase
    func testTrailingClosureExpr02() {
        let text = ##"f(1, "") { a: Int64 => return a}"##
        let expr = (parseText(text).node.getOrThrow() as TrailingClosureExpr).getOrThrow()
        @Expect(expr.toString(), text)
        @Expect(expr.arguments.size, 2)
        @Expect(expr.arguments[0].toString(), "1")
        @Expect(expr.arguments[1].toString(), ##""""##)
        let callee = (expr.callee as SymbolRef).getOrThrow()
        @Expect(callee.toString(), "f")
    }

    @TestCase
    func testTryCatch04() {
        let text = ##"try {
        a
    } catch (e: Exception | IOException) {
        b
    } catch (_) {
        c
    }"##
        let expr = (parseText(text).node.getOrThrow() as TryCatch).getOrThrow()
        @Expect(expr.toString(), text)
        @Expect(expr.tryBlock.toString(), ##"{
        a
    }"##)
        @Expect(expr.catchBlocks.size, 2)
        @Expect(expr.catchBlocks[0].toString(), ##"{
        b
    }"##)
        @Expect(expr.catchBlocks[1].toString(), ##"{
        c
    }"##)
        @Expect(expr.catchPatterns.size, 2)
        @Expect(expr.catchPatterns[0].toString(), "e: Exception | IOException")
        @Expect(expr.catchPatterns[1].toString(), "_")
        @Expect(expr.finallyBlock.isNone())
        @Expect(expr.resourceSpec.size, 0)
    }

    @TestCase
    func testTupleLiteral01() {
        let expr = (parseText("(1, 2, 3)").node.getOrThrow() as TupleLiteral).getOrThrow()
        @Expect(expr.elements.size, 3)
        @Expect(expr.elements[0].toString(), "1")
        @Expect(expr.elements[1].toString(), "2")
        @Expect(expr.elements[2].toString(), "3")
        @Expect(expr.toString(), "(1, 2, 3)")
    }

    @TestCase
    func testTypeConvExpr01() {
        let expr = (parseText("Int8(32)").node.getOrThrow() as TypeConvExpr).getOrThrow()
        @Expect(expr.srcVal.toString(), "32")
        let targetTy = (expr.targetTypeAnnotation as TypeAnnotation).getOrThrow()
        let targetType = (targetTy as AtomicType).getOrThrow()
        match (targetType.kind) {
            case Int8Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "Int8(32)")
    }

    @TestCase
    func testUnaryExpr01() {
        let expr = (parseText("!a").node.getOrThrow() as UnaryExpr).getOrThrow()
        match (expr.opKind) {
            case UnaryOpKind.Not => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.operand.toString(), "a")
        @Expect(expr.toString(), "!a")
    }

    @TestCase
    func testUnsafeExpr01() {
        let text = "unsafe { data.rawData() }"
        var expr = (parseText(text).node.getOrThrow() as UnsafeExpr).getOrThrow()
        @Expect(expr.toString(), text)
        @Expect(expr.block.toString(), "{ data.rawData() }")
    }

    @TestCase
    func testVarrayExpr01() {
        let expr = (parseText("VArray<Int64, $5>([0, 3 ,4])").node.getOrThrow() as VArrayExpr).getOrThrow()
        let varrayTy = (expr.vArrayType as VArrayType).getOrThrow()
        @Expect(varrayTy.size, 5)
        let elementTy = (varrayTy.elementType as TypeAnnotation).getOrThrow()
        let elementType = (elementTy as AtomicType).getOrThrow()
        match (elementType.kind) {
            case Int64Type => ()
            case _ => @FailExpect("kind wrong")
        }
        @Expect(expr.toString(), "VArray<Int64, $5>([0, 3 ,4])")
    }

    @TestCase
    func testWhileExpr02() {
        let text = """
while (x && y + 1 > 3) {
        println()
        return
    }"""
        let expr = (parseText(text).node.getOrThrow() as WhileExpr).getOrThrow()
        @Expect(expr.condition.toString(), "x && y + 1 > 3")
        @Expect(expr.body.toString(), """
{
        println()
        return
    }""")
        @Expect(expr.toString(), text)
    }

    @TestCase
    func testQuoteExpr01() {
        let text = """
quote(
    1
)"""
        let expr = (parseText(text).node.getOrThrow() as QuoteExpr).getOrThrow()
        @Expect(expr.toString(), text)
    }
}