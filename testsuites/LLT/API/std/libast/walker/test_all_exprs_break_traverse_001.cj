/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
* This source file is part of the Cangjie project, licensed under Apache-2.0
* with Runtime Library Exception.
*
* See https://cangjie-lang.cn/pages/LICENSE for license information.
*/

// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args | compare %f

import std.ast.*

class MyVisitor <: Visitor {

    public override func visit(_: WhileExpr) { println("Visiting WhileExpr") }
    public override func visit(_: DoWhileExpr) { println("Visiting DoWhileExpr") }
    public override func visit(_: IfExpr) { println("Visiting IfExpr") }
    public override func visit(_: ForInExpr) { println("Visiting ForInExpr") }
    public override func visit(_: ReturnExpr) { println("Visiting ReturnExpr") }
    public override func visit(_: ThrowExpr) { println("Visiting ThrowExpr") }
    public override func visit(_: TryExpr) { println("Visiting TryExpr") }
    public override func visit(_: MatchExpr) { println("Visiting MatchExpr") }
    public override func visit(_: BinaryExpr) { println("Visiting BinaryExpr") }
    public override func visit(_: UnaryExpr) { println("Visiting UnaryExpr") }
    public override func visit(_: AssignExpr) { println("Visiting AssignExpr") }
    public override func visit(_: IncOrDecExpr) { println("Visiting IncOrDecExpr") }
    public override func visit(_: ParenExpr) { println("Visiting ParenExpr") }
    public override func visit(_: IsExpr) { println("Visiting IsExpr") }
    public override func visit(_: AsExpr) { println("Visiting AsExpr") }
    public override func visit(_: RangeExpr) { println("Visiting RangeExpr") }
    public override func visit(_: TypeConvExpr) { println("Visiting TypeConvExpr") }
    public override func visit(_: CallExpr) { println("Visiting CallExpr") }
    public override func visit(_: MemberAccess) { println("Visiting MemberAccess") }
    public override func visit(_: SubscriptExpr) { println("Visiting SubscriptExpr") }
    public override func visit(_: RefExpr) { println("Visiting RefExpr") }
    public override func visit(_: LambdaExpr) { println("Visiting LambdaExpr") }
    public override func visit(_: TrailingClosureExpr) { println("Visiting TrailingClosureExpr") }
    public override func visit(_: ArrayLiteral) { println("Visiting ArrayLiteral") }
    public override func visit(_: TupleLiteral) { println("Visiting TupleLiteral") }
    public override func visit(_: VArrayExpr) { println("Visiting VArrayExpr") }
    public override func visit(_: QuoteExpr) { println("Visiting QuoteExpr") }
    public override func visit(_: PrimitiveTypeExpr) { println("Visiting PrimitiveTypeExpr") }
    public override func visit(_: SpawnExpr) { println("Visiting SpawnExpr") }
    public override func visit(_: SynchronizedExpr) { println("Visiting SynchronizedExpr") }
    public override func visit(_: LetPatternExpr) { println("Visiting LetPatternExpr") }
    public override func visit(_: OptionalExpr) { println("Visiting OptionalExpr") }
    public override func visit(_: ResumeExpr) { println("Visiting ResumeExpr") }
    public override func visit(_: PerformExpr) { println("Visiting PerformExpr") }
    public override func visit(_: MacroExpandExpr) { println("Visiting MacroExpandExpr") }
    public override func visit(_: Expr) { println("Visiting Expr (Generic)") }
    public override func visit(_: Node) { println("Visiting Node (Generic)") }

}

main(): Unit {
    let visitor = MyVisitor()

    println("=== Testing WhileExpr ===")
    visitor.breakTraverse()
    let whileExpr = WhileExpr(quote(while(true) {}))
    whileExpr.traverse(visitor)

    println("=== Testing BinaryExpr ===")
    visitor.breakTraverse()
    let binaryExpr = BinaryExpr(quote(1 + 2))
    binaryExpr.traverse(visitor)

    println("=== Testing UnaryExpr ===")
    visitor.breakTraverse()
    let unaryExpr = UnaryExpr(quote(!true))
    unaryExpr.traverse(visitor)

    println("=== Testing IsExpr ===")
    visitor.breakTraverse()
    let isExpr = IsExpr(quote(a is Int64))
    isExpr.traverse(visitor)

    println("=== Testing AsExpr ===")
    visitor.breakTraverse()
    let asExpr = AsExpr(quote(a as Int64))
    asExpr.traverse(visitor)

    println("=== Testing ParenExpr ===")
    visitor.breakTraverse()
    let parenExpr = ParenExpr(quote((1 + 1)))
    parenExpr.traverse(visitor)

    println("=== Testing RefExpr ===")
    visitor.breakTraverse()
    let refExpr = RefExpr(quote(myVar))
    refExpr.traverse(visitor)

    println("=== Testing ReturnExpr ===")
    visitor.breakTraverse()
    let returnExpr = ReturnExpr(quote(return 0))
    returnExpr.traverse(visitor)

    println("=== Testing ThrowExpr ===")
    visitor.breakTraverse()
    let throwExpr = ThrowExpr(quote(throw Exception()))
    throwExpr.traverse(visitor)

    println("=== Testing AssignExpr ===")
    visitor.breakTraverse()
    let assignExpr = AssignExpr(quote(a = 10))
    assignExpr.traverse(visitor)

    println("=== Testing CallExpr ===")
    visitor.breakTraverse()
    let callExpr = CallExpr(quote(print("hello")))
    callExpr.traverse(visitor)

    println("=== Testing MemberAccess ===")
    visitor.breakTraverse()
    let memberAccess = MemberAccess(quote(obj.field))
    memberAccess.traverse(visitor)

    println("=== Testing IfExpr ===")
    visitor.breakTraverse()
    let ifExpr = IfExpr(quote(if(true){}))
    ifExpr.traverse(visitor)

    println("=== Testing LetPatternExpr ===")
    visitor.breakTraverse()
    let letPatternExpr = LetPatternExpr(quote(let Some(x) <- opt))
    letPatternExpr.traverse(visitor)

    println("=== Testing MatchExpr ===")
    visitor.breakTraverse()
    let matchExpr = MatchExpr(quote(match(x) { case _ => () }))
    matchExpr.traverse(visitor)

    println("=== Testing DoWhileExpr ===")
    visitor.breakTraverse()
    let doWhileExpr = DoWhileExpr(quote(do { } while(true)))
    doWhileExpr.traverse(visitor)

    println("=== Testing LambdaExpr ===")
    visitor.breakTraverse()
    let lambdaExpr = LambdaExpr(quote({ a => a + 1 }))
    lambdaExpr.traverse(visitor)

    println("=== Testing SpawnExpr ===")
    visitor.breakTraverse()
    let spawnExpr = SpawnExpr(quote(spawn { }))
    spawnExpr.traverse(visitor)

    println("=== Testing SynchronizedExpr ===")
    visitor.breakTraverse()
    let synchronizedExpr = SynchronizedExpr(quote(synchronized(lock) { }))
    synchronizedExpr.traverse(visitor)

    println("=== Testing TrailingClosureExpr ===")
    visitor.breakTraverse()
    let trailingClosureExpr = TrailingClosureExpr(quote(myFunc { x => x }))
    trailingClosureExpr.traverse(visitor)

    println("=== Testing ForInExpr ===")
    visitor.breakTraverse()
    let forInExpr = ForInExpr(quote(for (i in 0..10) {}))
    forInExpr.traverse(visitor)

    println("=== Testing ArrayLiteral ===")
    visitor.breakTraverse()
    let arrayLiteral = ArrayLiteral(quote([1, 2, 3]))
    arrayLiteral.traverse(visitor)

    println("=== Testing TupleLiteral ===")
    visitor.breakTraverse()
    let tupleLiteral = TupleLiteral(quote((1, "a")))
    tupleLiteral.traverse(visitor)

    println("=== Testing RangeExpr ===")
    visitor.breakTraverse()
    let rangeExpr = RangeExpr(quote(1..100))
    rangeExpr.traverse(visitor)

    println("=== Testing SubscriptExpr ===")
    visitor.breakTraverse()
    let subscriptExpr = SubscriptExpr(quote(arr[0]))
    subscriptExpr.traverse(visitor)

    println("=== Testing IncOrDecExpr ===")
    visitor.breakTraverse()
    let incOrDecExpr = IncOrDecExpr(quote(i++))
    incOrDecExpr.traverse(visitor)

    println("=== Testing TryExpr ===")
    visitor.breakTraverse()
    let tryExpr = TryExpr(quote(try { } catch(e: Exception) { }))
    tryExpr.traverse(visitor)

    println("=== Testing QuoteExpr ===")
    visitor.breakTraverse()
    let quoteExpr = QuoteExpr(quote(quote(x)))
    quoteExpr.traverse(visitor)

    println("=== Testing TypeConvExpr ===")
    visitor.breakTraverse()
    let typeConvExpr = TypeConvExpr(quote(Int64(10)))
    typeConvExpr.traverse(visitor)

    println("=== Testing OptionalExpr ===")
    visitor.breakTraverse()
    let optionalExpr = OptionalExpr(quote(a?))
    optionalExpr.traverse(visitor)

    println("=== Testing VArrayExpr ===")
    visitor.breakTraverse()
    let varrayExpr = VArrayExpr(quote(VArray<Int64, \$5>({ i => i })))
    varrayExpr.traverse(visitor)

    println("=== Testing MacroExpandExpr ===")
    visitor.breakTraverse()
    let macroExpandExpr = MacroExpandExpr(quote(@M (a is Int64)))
    macroExpandExpr.traverse(visitor)

    println("=== Testing ResumeExpr ===")
    visitor.breakTraverse()
    let resumeExpr = ResumeExpr(quote(resume with 42))
    resumeExpr.traverse(visitor)

    println("=== Testing PerformExpr ===")
    visitor.breakTraverse()
    let performExpr = PerformExpr(quote(perform Eff()))
    performExpr.traverse(visitor)
}

/* SCAN
=== Testing WhileExpr ===
Visiting WhileExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing BinaryExpr ===
Visiting BinaryExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing UnaryExpr ===
Visiting UnaryExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing IsExpr ===
Visiting IsExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing AsExpr ===
Visiting AsExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ParenExpr ===
Visiting ParenExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing RefExpr ===
Visiting RefExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ReturnExpr ===
Visiting ReturnExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ThrowExpr ===
Visiting ThrowExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing AssignExpr ===
Visiting AssignExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing CallExpr ===
Visiting CallExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing MemberAccess ===
Visiting MemberAccess
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing IfExpr ===
Visiting IfExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing LetPatternExpr ===
Visiting LetPatternExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing MatchExpr ===
Visiting MatchExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing DoWhileExpr ===
Visiting DoWhileExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing LambdaExpr ===
Visiting LambdaExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing SpawnExpr ===
Visiting SpawnExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing SynchronizedExpr ===
Visiting SynchronizedExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing TrailingClosureExpr ===
Visiting TrailingClosureExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ForInExpr ===
Visiting ForInExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ArrayLiteral ===
Visiting ArrayLiteral
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing TupleLiteral ===
Visiting TupleLiteral
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing RangeExpr ===
Visiting RangeExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing SubscriptExpr ===
Visiting SubscriptExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing IncOrDecExpr ===
Visiting IncOrDecExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing TryExpr ===
Visiting TryExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing QuoteExpr ===
Visiting QuoteExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing TypeConvExpr ===
Visiting TypeConvExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing OptionalExpr ===
Visiting OptionalExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing VArrayExpr ===
Visiting VArrayExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing MacroExpandExpr ===
Visiting MacroExpandExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing ResumeExpr ===
Visiting ResumeExpr
Visiting Expr (Generic)
Visiting Node (Generic)
=== Testing PerformExpr ===
Visiting PerformExpr
Visiting Expr (Generic)
Visiting Node (Generic)
*/