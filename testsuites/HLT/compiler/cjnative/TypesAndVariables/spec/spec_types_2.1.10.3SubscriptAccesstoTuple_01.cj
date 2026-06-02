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

func multiValues(a: Int32, b: Int32) {
    (a + b, a - b)
} // The type of the return value of the function multiValues is Int32*Int32. 

main() {
    var z = multiValues(8, 24) // the type of z is inferred to be Int32*Int32
    print("${z[0]}") // output: 32
    print("${z[1]}") // output: -16
    return 0
}
