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

struct I {
    func test1() {
        var a = 10
        var b = -10
        while (b + test() < 10) {
            a = 30
            b = test()
            while (b + test() < 5) {
                a = 40
            }
        }
        if (a + 10 < 0) {
            return 1
        } else {
            return 0
        }
    }
}

main() {
    var a = I()
    return a.test1()
}
