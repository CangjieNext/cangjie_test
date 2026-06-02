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
// ASSERT:scan generic

func test<T>(a: T, flag: Bool): Unit {
    if (flag) {
        print("generic")
        return
    }
    func test(a: T, b: T) {
        print("normal")
    }
    test(true, true)
    return
}

main(): Int64 {
    test<Bool>(false, false)
    return 0
}
