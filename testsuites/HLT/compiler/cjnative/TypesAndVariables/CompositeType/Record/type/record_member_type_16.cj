/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Foo {
    let x: Int32 = 3 
}

class Loo <: Foo {
    public let y: Int32 = 4
}

struct Test {
    public let a: Foo = Loo()
}

func run(): Int64 {
    var res = Test().a.y
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
