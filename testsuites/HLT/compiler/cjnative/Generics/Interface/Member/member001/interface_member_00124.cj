/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I<Y> {
    func t<Y>(a: Y): Y {
        return a
    }
}

class A <: I<Int32> {
    var a: Int32 = 1
    var b = t<Int32>(a)
}

main() {
    A()
    return 0
}

// ASSERT: scan sema_illegal_usage_of_member
