// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public func foo(a: Int32, b: T, c!: Int32 = 42) : Int32 {
            if ( a > 100 ) {
                return 42
            }
            let d = a + c
            return d
        }
    )
    let fd = parseDecl(input) as FuncDecl
    var funcDecl = match (fd) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($funcDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (funcDecl.identifier.value != "foo") {
        return 2
    }
    // Test return type.
    let ty = funcDecl.declType
    // Test modifiers.
    let modifiers = funcDecl.modifiers
    if (modifiers.size != 1) {
        return 3
    }
    if (modifiers[0].keyword.value != "public") {
        return -1
    }
    var newDecl = VarDecl(quote(var e = 1))
    funcDecl.declType = PrimitiveType(quote(Int64))
    funcDecl.block.nodes.add(newDecl, at: 1)
    funcDecl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
