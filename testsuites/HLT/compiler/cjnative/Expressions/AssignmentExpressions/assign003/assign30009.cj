/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

class LA {
    public var a: Array<(Int32, Int32)>
    public init(a: Int32) {
        this.a = {=> (a, a)}
    }
}

main(): Int64 {
    var l_a = LA(4)
    l_a.a[0][0]++
    if (l_a.a[0][0] != Int32(5)) {
        return 1
    }
    l_a.a[0][0]--
    if (l_a.a[0][0] != Int32(4)) {
        return 2
    }
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_unqualified_left_value_assigned
