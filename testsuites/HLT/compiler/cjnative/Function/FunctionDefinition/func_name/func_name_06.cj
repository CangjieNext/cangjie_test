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

struct Temp1 {
    func test_func() {
        1
    }
}

struct Temp2 {
    func test_func() {
        2
    }
}

main() {
    var a1 = Temp1()
    var a2 = Temp2()
    var res1 = a1.test_func()
    var res2 = a2.test_func()
    return res1 + res2 - 3
}
