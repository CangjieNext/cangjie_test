// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex-auto 6.310000

struct Rcd {
    public var a0: Int64 = 5
    public var a1: Int64 = 2
    public var f0: Float32 = 3.1500
    public var f1: Float64 = 3.160000
}

main(): Int64 {
    var array4 = [Rcd()]
    var t = Float32(array4[0].f1)
    print((array4[0].f0 + t).toString())
    var elem = array4[0]
    return array4[0].a1 - array4[0].a0 * elem.a0 + 43
    // it will return: 2 - 5 * 9 + 43 = 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
