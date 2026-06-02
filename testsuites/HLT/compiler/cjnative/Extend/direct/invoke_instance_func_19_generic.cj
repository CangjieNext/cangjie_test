/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output 

class A<T> {
    public A(let b!: Int32 = 0) {
    }

    public func aaa() {
        return b
    }
}

extend<T> A<T> {
    public func me() {
        this()
    }
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
