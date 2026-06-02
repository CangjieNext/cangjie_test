// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -o %output 2>&1 | compare %f
// ASSERT: scan arithmetic operation '/' overflow

func test() {
    try {
        let w: Int8 = -128 / -1
        print("w = " + w.toString() + "\n")
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