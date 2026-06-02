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
    public override func visit(_: RefType) {
        println("visit RefType")
    }
    public override func visit(_: QualifiedType) {
        println("visit QualifiedType")
    }
    public override func visit(_: ParenType) {
        println("visit ParenType")
    }
    public override func visit(_: TupleType) {
        println("visit TupleType")
    }
    public override func visit(_: PrefixType) {
        println("visit PrefixType")
    }
    public override func visit(_: FuncType) {
        println("visit FuncType")
    }
    public override func visit(_: VArrayType) {
        println("visit VArrayType")
    }

    public override func visit(_: TypeNode) {
        println("visit TypeNode(Generic)")
    }
    public override func visit(_: Node) {
        println("visit Node(Generic)")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    println("=== Testing RefType ===")
    visitor.breakTraverse()
    let refType = RefType(quote(
        A
    ))
    refType.traverse(visitor)

    println("=== Testing QualifiedType ===")
    visitor.breakTraverse()
    let qualifiedType = QualifiedType(quote(
        std.collection.ArrayList
    ))
    qualifiedType.traverse(visitor)

    println("=== Testing ParenType ===")
    visitor.breakTraverse()
    let parenType = ParenType(quote(
        (Int64)
    ))
    parenType.traverse(visitor)

    println("=== Testing TupleType ===")
    visitor.breakTraverse()
    let tupleType = TupleType(quote(
        (Int64, String)
    ))
    tupleType.traverse(visitor)

    println("=== Testing PrefixType ===")
    visitor.breakTraverse()
    let prefixType = PrefixType(quote(
        ?Int64
    ))
    prefixType.traverse(visitor)

    println("=== Testing FuncType ===")
    visitor.breakTraverse()
    let funcType = FuncType(quote(
        (Int64) -> Unit
    ))
    funcType.traverse(visitor)

    println("=== Testing VArrayType ===")
    visitor.breakTraverse()
    let vArrayType = VArrayType()
    vArrayType.traverse(visitor)
}

/* SCAN-IN
=== Testing RefType ===
visit RefType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing QualifiedType ===
visit QualifiedType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing ParenType ===
visit ParenType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing TupleType ===
visit TupleType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing PrefixType ===
visit PrefixType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing FuncType ===
visit FuncType
visit TypeNode(Generic)
visit Node(Generic)
=== Testing VArrayType ===
visit VArrayType
visit TypeNode(Generic)
visit Node(Generic)
*/