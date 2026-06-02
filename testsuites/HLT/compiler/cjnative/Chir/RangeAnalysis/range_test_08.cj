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

class I {
    var a: Int64 = test()
    func test1() {
        var b = -10
        for (i in 0..10) {
            a += 1
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
