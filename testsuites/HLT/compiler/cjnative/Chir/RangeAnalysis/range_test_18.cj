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

struct A {
    var a: Int64
    init() {
        var b = -10
        if (b + test() < 10) {
            a = 30
            b = test()
            if (b + test() < 5) {
                a = 40
            } else {
                a = 50
            }
        } else {
            a = 60
        }

        if (b + test() < 10) {
            a = 10
            b = test()
            if (b + test() < 5) {
                a = 5
            } else {
                a = 30
            }
        } else {
            a = 45
        }

        if (b + test() < 10) {
            a = 15
            b = test()
            if (b + test() < 5) {
                a = 20
            } else {
                a = 10
            }
        } else {
            a = 5
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
