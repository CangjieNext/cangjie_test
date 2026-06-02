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

func test(a: (VArray<Int64, $3>, VArray<Int64, $5>)): (VArray<Int64, $3>, VArray<Int64, $5>) {
    return a
}

main(): Int64 {
    return test(([1, 2, 3], [1, 2, 3, 4, 5]))[0][0] - test(([1, 2, 3], [1, 2, 3, 4, 5]))[1][0]
}
