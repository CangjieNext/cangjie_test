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

var temp: Int64 = 1

func f1() {
    return temp + 2
}

main(): Int64 {
    var b: Int64 = 4
    var c: String = ""
    let arrayTest = [0i32, 1i32, 2i32]

    try {
        let lastElement = arrayTest[f1()]
    } catch (_) {
        var a1 = ["catch an exception!"]
        c = a1[0]
        print(c)
    }
    if (c == "catch an exception!") {
        return 0;
    }
    return 1;
}
