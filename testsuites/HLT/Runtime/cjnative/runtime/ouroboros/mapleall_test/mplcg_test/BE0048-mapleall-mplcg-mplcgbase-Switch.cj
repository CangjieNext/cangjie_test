/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 1371421004537142104310045100047

func test(j: Int32): Unit {
    let str: Int32 = match (j) {
        case 37 | 9472 => 37
        case 42 | 10752 => 142
        case 43 | 11008 => 1043
        case 45 | 11520 => 10045
        case 47 | 12032 => 100047
        case _ => 1
    }
    print(str.toString())
}

main(): Int64 {
    test(0)
    test(37)
    test(42)
    test(45)
    test(9472)
    test(10752)
    test(11008)
    test(11520)
    test(12032)
    return 0
}
