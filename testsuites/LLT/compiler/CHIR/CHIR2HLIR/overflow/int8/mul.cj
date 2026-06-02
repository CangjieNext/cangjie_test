// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan w1 = -16
// ASSERT: scan s1 = 127
// ASSERT: scan s2 = 127

internal import std.overflow.*

@OverflowWrapping
func test(x: Int8, y: Int8) {
    let w1 = x * y // 此时采用截断处理策略，不会抛异常。
    print("w1 = " + w1.toString() + "\n")

    let s1 = x.saturatingMul(y) // 此时采用饱和处理策略。
    print("s1 = " + s1.toString() + "\n")

    let s2 = @OverflowSaturating {
        => x * y // 此时采用饱和处理策略，不会抛异常。
    }
    print("s2 = " + s2().toString() + "\n")
}

main() {
    let MAX_INT8: Int8 = 127
    let a: Int8 = MAX_INT8 / 8
    test(a, 16)
    return 0
}
