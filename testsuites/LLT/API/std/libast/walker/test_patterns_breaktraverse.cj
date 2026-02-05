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

public class MyVisitor <: Visitor {
    public override func visit(_: ConstPattern) {
        println("visit ConstPattern")
    }
    public override func visit(_: ExceptTypePattern) {
        println("visit ExceptTypePattern")
    }
    public override func visit(_: CommandTypePattern) {
        println("visit CommandTypePattern")
    }
    public override func visit(_: TypePattern) {
        println("visit TypePattern")
    }
    public override func visit(_: EnumPattern) {
        println("visit EnumPattern")
    }
    public override func visit(_: TuplePattern) {
        println("visit TuplePattern")
    }


    public override func visit(_: Pattern) {
        println("visit Pattern(Generic)")
    }
    public override func visit(_: Node) {
        println("visit Node(Generic)")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    println("=== Testing ConstPattern ===")
    visitor.breakTraverse()
    let constPattern = ConstPattern(quote(100))
    constPattern.traverse(visitor)

    println("=== Testing ExceptTypePattern ===")
    visitor.breakTraverse()
    let exceptPattern = ExceptTypePattern(quote(
        e: Exception
    ))
    exceptPattern.traverse(visitor)

    println("=== Testing CommandTypePattern ===")
    visitor.breakTraverse()
    let commandPattern = CommandTypePattern(quote(
        pattern: Type1 | Type2 
    ))
    commandPattern.traverse(visitor)

    println("=== Testing TypePattern ===")
    visitor.breakTraverse()
    let typePattern = TypePattern(quote(
        x: Int64
    ))
    typePattern.traverse(visitor)

    println("=== Testing EnumPattern ===")
    visitor.breakTraverse()
    let enumPattern = EnumPattern(quote(
        Option.Some(x)
    ))
    enumPattern.traverse(visitor)

    println("=== Testing TuplePattern ===")
    visitor.breakTraverse()
    let tuplePattern = TuplePattern(quote(
        ((1, 1),(1, 2))
    ))
    tuplePattern.traverse(visitor)
}

/* SCAN-IN
=== Testing ConstPattern ===
visit ConstPattern
visit Pattern(Generic)
visit Node(Generic)
=== Testing ExceptTypePattern ===
visit ExceptTypePattern
visit Pattern(Generic)
visit Node(Generic)
=== Testing CommandTypePattern ===
visit CommandTypePattern
visit Pattern(Generic)
visit Node(Generic)
=== Testing TypePattern ===
visit TypePattern
visit Pattern(Generic)
visit Node(Generic)
=== Testing EnumPattern ===
visit EnumPattern
visit Pattern(Generic)
visit Node(Generic)
=== Testing TuplePattern ===
visit TuplePattern
visit Pattern(Generic)
visit Node(Generic)
*/