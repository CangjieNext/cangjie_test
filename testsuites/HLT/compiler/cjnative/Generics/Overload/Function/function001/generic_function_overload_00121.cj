/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

func test<T>(input: T, flag: Bool): Unit {
    if (flag) {
        print("true")
        return
    }
    func test(a: T, flag: Bool) {
        print("inside")
    }
    test<T>(input, true)
    return
}

main(): Int64 {
    test<Int64>(1, false)
    return 0
}

// ASSERT: scan true
