/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
func test(a: Int8): Int64 {
    1
}

func test(a: Bool): Int64 {
    2
}

main(): Int64 {
    if (test(true) != 2) {
        return 1
    }
    return 0
}
