// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w = -9223372036854775808
// ASSERT: scan s = 9223372036854775807

func test() {
    let w: Int64 = 9223372036854775807 + 1 // wrapping
    print("w = " + w.toString() + "\n")

    let s = @OverflowSaturating {
        =>
        let a: Int64 = 9223372036854775807 + 1 // saturating
        a
    }
    print("s = " + s().toString() + "\n")
}

main() {
    test()
    return 0
}
