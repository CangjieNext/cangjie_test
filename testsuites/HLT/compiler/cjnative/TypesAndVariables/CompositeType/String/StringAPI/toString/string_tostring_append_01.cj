/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface foo {
    func toString(): String
}

extend Int32 <: foo {
    public func toString(): String {
        return "yes"
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b = a.toString()
    print("toStringTest:" + b)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_ambiguous_match
