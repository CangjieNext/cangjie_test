/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 5) {
        return 1
    }
    return 0
}

func case01() {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (_ in intArray) {
        a++
    }
    a
}
