// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-2 ASTException: Cannot construct the 'ExtendDecl' node.

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens0 = quote( 
        extend Foo <:I {
            func f() {}
        }
    )
    try {
        let extendDecl0 = ExtendDecl(tokens0)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens1 = quote( 
        extend<> Foo <:I {
            func f() {}
        }
    )
    try {
        let extendDecl1 = ExtendDecl(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        interface Foo<T1> <: I1  {
            func f(): Int32 {
                return 42
            }
        }
    )
    try {
        let extendDecl2 = ExtendDecl(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (cnt != 2) {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
