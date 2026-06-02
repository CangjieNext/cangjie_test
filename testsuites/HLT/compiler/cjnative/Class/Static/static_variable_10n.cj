/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data<T> {
    public static func foo(x: Int32): T {
        return a
    }
    public static let a: T = foo(1)
}

func run(): Int64 {
    var v0: Int32 = 1
    if (Data<Int32>.foo(v0) != Data<Int32>.a) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_global_var_used_before_initialization
