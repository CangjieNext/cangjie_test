/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var lmda1 = {
    =>
    var test = 10
    test
}
var lmda2 = {
    => 100 + 100
}
var lmda3: (Int32) -> Int32 = {
    x: Int32 =>
    var test: Int32 = 100
    test + 100
}
let test: Int32 = 10
var lmda4 = {
    x: Int32 => x + test + 100
}

main(): Int64 {
    var num: Int32 = 2
    var res1 = lmda1()
    var res2: Int64 = lmda2()
    var res3: Int32 = lmda3(num)
    var res4: Int32 = lmda4(10)
    if (res1 != 10 || res2 != 200 || res3 != 200 || res4 != 120) {
        return 1
    }
    return 0
}
