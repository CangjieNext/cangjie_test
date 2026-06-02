// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-2 the number '18446744073709551615' exceeds the value range of type 'Int64'

func test() {
    let w1 = UInt64(18446744073709551615 ** 2) // wrapping
    print("w1 = " + w1.toString() + "\n")

    let s1 = @OverflowSaturating {
        =>
        let a = UInt64(18446744073709551615 ** 2) // saturating
        a
    }
    print("s1 = " + s1().toString() + "\n")
}

main() {
    test()
    return 0
}
