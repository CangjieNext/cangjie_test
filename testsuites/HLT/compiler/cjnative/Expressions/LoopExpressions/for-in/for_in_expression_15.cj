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
    if (case01() != 32) {
        return 1
    }
    return 0
}

func case01() {
    func foo(input: Int64): Int64 {
        input
    }
    let intArray: Array<(Int64) -> Int64> = [foo, foo, foo, foo, foo]
    var a: Int64 = 1
    for (item in intArray) {
        a = a + item(a)
    }
    a
}
