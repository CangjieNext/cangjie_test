/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*

class MyVisitor <: Visitor {

    public override func visit(_: WhileExpr) { println("Triggered: WhileExpr") }
    public override func visit(_: DoWhileExpr) { println("Triggered: DoWhileExpr") }
    public override func visit(_: IfExpr) { println("Triggered: IfExpr") }
    public override func visit(_: ForInExpr) { println("Triggered: ForInExpr") }
    public override func visit(_: ReturnExpr) { println("Triggered: ReturnExpr") }
    public override func visit(_: ThrowExpr) { println("Triggered: ThrowExpr") }
    public override func visit(_: TryExpr) { println("Triggered: TryExpr") }
    public override func visit(_: MatchExpr) { println("Triggered: MatchExpr") }


    public override func visit(_: BinaryExpr) { println("Triggered: BinaryExpr") }
    public override func visit(_: UnaryExpr) { println("Triggered: UnaryExpr") }
    public override func visit(_: AssignExpr) { println("Triggered: AssignExpr") }
    public override func visit(_: IncOrDecExpr) { println("Triggered: IncOrDecExpr") }
    public override func visit(_: ParenExpr) { println("Triggered: ParenExpr") }
    public override func visit(_: IsExpr) { println("Triggered: IsExpr") }
    public override func visit(_: AsExpr) { println("Triggered: AsExpr") }
    public override func visit(_: RangeExpr) { println("Triggered: RangeExpr") }
    public override func visit(_: TypeConvExpr) { println("Triggered: TypeConvExpr") }

  
    public override func visit(_: CallExpr) { println("Triggered: CallExpr") }
    public override func visit(_: MemberAccess) { println("Triggered: MemberAccess") }
    public override func visit(_: SubscriptExpr) { println("Triggered: SubscriptExpr") }
    public override func visit(_: RefExpr) { println("Triggered: RefExpr") }
    
 
    public override func visit(_: LambdaExpr) { println("Triggered: LambdaExpr") }
    public override func visit(_: TrailingClosureExpr) { println("Triggered: TrailingClosureExpr") }


    public override func visit(_: ArrayLiteral) { println("Triggered: ArrayLiteral") }
    public override func visit(_: TupleLiteral) { println("Triggered: TupleLiteral") }
    public override func visit(_: VArrayExpr) { println("Triggered: VArrayExpr") }
    public override func visit(_: QuoteExpr) { println("Triggered: QuoteExpr") }
    public override func visit(_: PrimitiveTypeExpr) { println("Triggered: PrimitiveTypeExpr") }


    public override func visit(_: SpawnExpr) { println("Triggered: SpawnExpr") }
    public override func visit(_: SynchronizedExpr) { println("Triggered: SynchronizedExpr") }

    

    public override func visit(_: LetPatternExpr) { println("Triggered: LetPatternExpr") }
    public override func visit(_: OptionalExpr) { println("Triggered: OptionalExpr") }
    

    public override func visit(_: Expr) { println("Triggered: Expr (Generic)") }
    public override func visit(_: Node) { println("Triggered: Node (Generic)") }
}

// 解析并遍历
func testNode(name: String, input: Tokens, visitor: MyVisitor) {
    println("\n=== Testing ${name} ===")
    try {
        visitor.breakTraverse()
        // 使用 parseExpr 将 Tokens 转换为 Expr
        let expr = parseExpr(input)
        expr.traverse(visitor)
    } catch (e: Exception) {
        println("Error parsing ${name}: ${e}")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    // 1. WhileExpr
    testNode("WhileExpr", quote(while(true) {}), visitor)


    // 2. BinaryExpr
    testNode("BinaryExpr", quote(1 + 2), visitor)

    // 3. UnaryExpr
    testNode("UnaryExpr", quote(!true), visitor)

    // 4. IsExpr
    testNode("IsExpr", quote(a is Int64), visitor)

    // 5. AsExpr
    testNode("AsExpr", quote(a as Int64), visitor)

    // 6. ParenExpr
    testNode("ParenExpr", quote((1 + 1)), visitor)

    // 7. RefExpr
    testNode("RefExpr", quote(myVar), visitor)

    // 8. ReturnExpr
    testNode("ReturnExpr", quote(return 0), visitor)

    // 9. ThrowExpr
    testNode("ThrowExpr", quote(throw Exception()), visitor)

    // 10. AssignExpr
    testNode("AssignExpr", quote(a = 10), visitor)

    // 11. CallExpr
    testNode("CallExpr", quote(print("hello")), visitor)

    // 12. MemberAccess
    testNode("MemberAccess", quote(obj.field), visitor)

    // 13. IfExpr
    testNode("IfExpr", quote(if(true){}), visitor)

    // 14. LetPatternExpr
    testNode("LetPatternExpr", quote(if (let Some(x) <- opt) {}), visitor)

    // 15. MatchExpr
    testNode("MatchExpr", quote(match(x) { case _ => () }), visitor)

    // 16. DoWhileExpr
    testNode("DoWhileExpr", quote(do { } while(true)), visitor)

    // 17. LambdaExpr
    testNode("LambdaExpr", quote({ a => a + 1 }), visitor)

    // 18. SpawnExpr
    testNode("SpawnExpr", quote(spawn { }), visitor)

    // 19. SynchronizedExpr
    testNode("SynchronizedExpr", quote(synchronized(lock) { }), visitor)

    // 20. TrailingClosureExpr
    testNode("TrailingClosureExpr", quote(myFunc { x => x }), visitor)

    // 21. ForInExpr
    testNode("ForInExpr", quote(for (i in 0..10) {}), visitor)

    // 22. ArrayLiteral
    testNode("ArrayLiteral", quote([1, 2, 3]), visitor)

    // 23. TupleLiteral
    testNode("TupleLiteral", quote((1, "a")), visitor)

    // 24. RangeExpr
    testNode("RangeExpr", quote(1..100), visitor)

    // 25. SubscriptExpr
    testNode("SubscriptExpr", quote(arr[0]), visitor)

    // 26. IncOrDecExpr
    testNode("IncOrDecExpr", quote(i++), visitor)

    // 27. TryExpr
    testNode("TryExpr", quote(try { } catch(e: Exception) { }), visitor)

    // 28. QuoteExpr
    testNode("QuoteExpr", quote(quote(x)), visitor)

    // 29. TypeConvExpr
    testNode("TypeConvExpr", quote(Int64(10)), visitor)

}

/* SCAN

=== Testing WhileExpr ===
Triggered: WhileExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing BinaryExpr ===
Triggered: BinaryExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing UnaryExpr ===
Triggered: UnaryExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing IsExpr ===
Triggered: IsExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing AsExpr ===
Triggered: AsExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing ParenExpr ===
Triggered: ParenExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing RefExpr ===
Triggered: RefExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing ReturnExpr ===
Triggered: ReturnExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing ThrowExpr ===
Triggered: ThrowExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing AssignExpr ===
Triggered: AssignExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing CallExpr ===
Triggered: CallExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing MemberAccess ===
Triggered: MemberAccess
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing IfExpr ===
Triggered: IfExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing LetPatternExpr ===
Triggered: IfExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing MatchExpr ===
Triggered: MatchExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing DoWhileExpr ===
Triggered: DoWhileExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing LambdaExpr ===
Triggered: LambdaExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing SpawnExpr ===
Triggered: SpawnExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing SynchronizedExpr ===
Triggered: SynchronizedExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing TrailingClosureExpr ===
Triggered: TrailingClosureExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing ForInExpr ===
Triggered: ForInExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing ArrayLiteral ===
Triggered: ArrayLiteral
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing TupleLiteral ===
Triggered: TupleLiteral
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing RangeExpr ===
Triggered: RangeExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing SubscriptExpr ===
Triggered: SubscriptExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing IncOrDecExpr ===
Triggered: IncOrDecExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing TryExpr ===
Triggered: TryExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing QuoteExpr ===
Triggered: QuoteExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)

=== Testing TypeConvExpr ===
Triggered: TypeConvExpr
Triggered: Expr (Generic)
Triggered: Node (Generic)
*/