/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    operator func *(b: A<T>): Bool {
        this()
        return true
    }
}

main(): Int64 {
    var a: A<Int32> = A<Int32>()
    var b: A<Int32> = A<Int32>()
    if (!(b * a)) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
