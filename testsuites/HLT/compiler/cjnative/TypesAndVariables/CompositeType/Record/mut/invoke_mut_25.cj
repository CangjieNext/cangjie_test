/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

let b = R(a: 6)

main() {
    func a() {
        b.c(4)
    }
    a()
    return Int64(b.a - 16)
}

struct R {
    public var a: Int32 = 8
    public mut func c(b: Int32): Int32 {
        a = a + b
        return 0
    }
    public init(a!: Int32 = 8) {
        this.a = a
    }
}
// ASSERT: scan sema_immutable_access_mutable_func
