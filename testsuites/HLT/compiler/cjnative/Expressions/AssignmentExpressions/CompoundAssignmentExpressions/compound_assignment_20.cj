/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func bar(x: Int64, y!: Unit = (x += 1)) {
    var a = x
    a **= 3
}

func foo(x: Int64, y!: Unit = (x += 1)) {
    var a = x
    a **= 3
    a
}

main(): Int64 {
    var res1 = foo(3)
    var res2 = bar(3)
    if (res1 == 27 && res2 == ()) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
