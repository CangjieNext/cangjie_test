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

func test() {
    return 10
}

class A {
    var a: Int64
    init() {
        var b = -10
        if (b + test() < 10) {
            a = 30
        } else {
            a = 60
        }
    }
}

main() {
    var a = A()
    if (a.a + 10 < 0) {
        return 1
    } else {
        return 0
    }
}
