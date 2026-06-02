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

main(): Int64 {
    func multiValues(a: Int32, b: Int32) {
        ((a, b), (a + b, a - b))
    }
    var (x, y) = multiValues(8, 24)
    print(x[0].toString() + "\n")
    print(x[1].toString() + "\n")
    print(y[0].toString() + "\n")
    print(y[1].toString() + "\n")
    if (x[0] == 8 && x[1] == 24 && y[0] == 32 && y[1] == -16) {
        return 0
    }
    return 1
}
