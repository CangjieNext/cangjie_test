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
    A(var a!: Int64 = 5) {
    }
}

extend<T> A<T> {
    public func me() {
        return 0
    }

    public func me(): Int64 {
        return a
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_overload_conflicts
