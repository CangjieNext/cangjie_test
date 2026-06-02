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
    var l: (Int32) -> Int32
    var r: (Int32) -> Int32
    func test(a: Int32): Int32 {
        a
    }
    r = test
    var temp = r
    l = temp
    if (l(1) == r(1)) {
        return 0
    }
    return 1
}
