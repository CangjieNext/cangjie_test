/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var sum = {f: (Int64, Int64) -> Int64, a: Int64, b: Int64 => f(a, b)}
    func myfunc(a: Int64, b: Int64): Unit {
        return
    }
    sum(myfunc(0, 0))
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_wrong_number_of_arguments
