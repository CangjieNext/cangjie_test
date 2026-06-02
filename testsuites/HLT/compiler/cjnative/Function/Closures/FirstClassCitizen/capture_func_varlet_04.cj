/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var a: Int32 = 1

    func foo(x!: Int32 = a) {
        return x
    }

    func test(y: (Int32) -> Int32) {
        return y(a)
    }

    var ret = test(foo)

    if (ret != 1) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_use_func_capture_var_alone
