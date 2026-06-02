// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 8

var a = true

func f1() {
    var x = 1

    if (a) {
        func f2() {
            x++ // x = 2
            func f3() {
                x++
            }

            func f4() {
                x++ // x = 3
                f3() // x = 4
                f3() // x = 5
            }
            f4()
        }
        f2()
    }
    func f5() {
        x++
    }
    f5() // x = 6
    x++ // x = 7
    f5() // x = 8
    println(x)
}

main() {
    f1()
    0
}