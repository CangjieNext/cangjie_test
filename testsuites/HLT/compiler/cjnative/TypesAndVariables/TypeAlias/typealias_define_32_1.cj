/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface InterfaceA {
    let i: Int32 = 2 
}

type IA = InterfaceA

class C <: IA {
    public var j: Int32 = InterfaceA.i 
    public func get(): Int32 {
        return j
    }
}

main(): Int64 {
    var test: C = C()
    if (test.get() == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
