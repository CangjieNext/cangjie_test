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

var bar: (Int64, Unit) -> Unit = {
    x: Int64, y: Unit =>
    var a = x
    a **= 3
}
var foo: (Int64, Unit) -> Int64 = {
    x: Int64, y: Unit =>
    var a = x
    a **= 3
    a
}

main(): Int64 {
    var res1 = foo(3, ())
    var res2 = bar(3, ())
    if (res1 == 27 && res2 == ()) {
        return 0
    }
    return 1
}
