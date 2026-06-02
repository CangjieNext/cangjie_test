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

@OverflowWrapping
func test(a: UInt8, b: UInt8) {
    return a * b
}

main() {
    var temp = test(100, 3)
    print("${temp}\n")
    return Int64(temp - 44)
}
