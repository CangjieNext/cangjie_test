// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = 1
// ASSERT: scan w2 = -127
// ASSERT: scan s1 = 127
// ASSERT: scan s2 = -128

func test() {
    let w1 = Int8(127 ** 2) // wrapping
    print("w1 = " + w1.toString() + "\n")
    let w2 = Int8(-127 ** 3) // wrapping
    print("w2 = " + w2.toString() + "\n")

    let s1 = @OverflowSaturating {
        =>
        let a = Int8(127 ** 2) // saturating
        a
    }
    print("s1 = " + s1().toString() + "\n")
    let s2 = @OverflowSaturating {
        =>
        let a = Int8(-127 ** 3) // saturating
        a
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    test()
    return 0
}
