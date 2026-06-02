// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan s1 = 9223372036854775807

internal import std.math.*

class C<T> {
    public var x: T
    public init(y: T) {
        this.x = y
    }

    @OverflowSaturating
    public func testadd(a: Int64, b: Int64): Int64 {
        a + b
    }
}

main() {
    var s = C<Int64>(1)
    var s1 = s.testadd(Int64.Max, 1)
    print("s1 = " + s1.toString() + "\n")
    return 0
}
