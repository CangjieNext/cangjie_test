/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan \n
// ASSERT: scan class A {
// ASSERT: scan var a = @1
// ASSERT: scan }
// ASSERT: scan \n
import std.ast.*

class A {
    var new_tokens = quote(
        class A{
                            var a = @  1
        }
    )
    func test() {
        var a = new_tokens.toString()
        println(a)
    }
}

main() {
    var a = A()
    a.test()
    return 0
}
