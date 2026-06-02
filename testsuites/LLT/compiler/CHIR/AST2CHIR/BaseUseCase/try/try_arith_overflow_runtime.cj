// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-begin caught exception
// ASSERT: scan-next OverflowException: div
// ASSERT: scan-end

var a = 3

func test() {
    try {
        var w: Int8 = 1
        if (a > 1) {
            w = -128
        }
        let x: Int8 = w / -1
        print("x = " + x.toString() + "\n")
    } catch (e: Exception) {
        println("caught exception")
        print(e)
    } finally {
        print("done")
    }
}

main () {
    test()
    0
}