/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct LA {
    public var a: Array<(Bool, Bool)>
    public init(input: Bool) {
        a = [(input, input)]
    }
}

main(): Int64 {
    var l_a = LA(false)
    var r_a = 1
    var r_b = 1
    l_a.a[0][0] = r_a == r_b
    if (l_a.a[0][0] == true) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_unqualified_left_value_assigned
