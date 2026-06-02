// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: PrimitiveType) {
        println("?")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    var cnt = 0

    let input = quote(
        (Int64, Int32)
    )
    try {
        PrefixType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        PrefixType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        PrefixType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let prefixType = PrefixType(quote(?Int64))
        prefixType.traverse(myVisitor)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
Cannot construct the 'PrefixType' node.
parsing type error.
?
cnt = 2
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
