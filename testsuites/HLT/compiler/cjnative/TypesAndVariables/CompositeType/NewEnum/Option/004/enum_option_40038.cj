/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {
    public func test() {
        1
    }
}

main(): Int64 {
    let c1: ?C = C()
    c1?.test = {=> 10}
    let r1 = c1?.test
    let res = r1 ?? {=> 100}
    return res() - 10
}
// ASSERT: scan sema_unqualified_left_value_assigned
