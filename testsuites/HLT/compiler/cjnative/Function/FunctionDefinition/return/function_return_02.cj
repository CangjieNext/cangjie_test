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
    if (case01()[2][0] != 1) {
        return 1
    }
    if (case02(1, 2)[2][0] != 1) {
        return 2
    }
    return 0
}

func case01() {
    let a = (1, 2, (1, 2, 3))
    return a
}

func case02(a: Int32, b: Int32): (Int32, Int32, (Int32, Int32, Int32)) {
    let a1 = (a, b, (a, b, a))
    return a1
}
