/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<Y> {
    func t(a: X): X {
        return a
    }
}

class A <: I<Int32> {
    var a: Int32 = 1
    var b = t(a)
}

main() {
    A()
    return 0
}
// ASSERT: scan sema_undeclared_type_name
