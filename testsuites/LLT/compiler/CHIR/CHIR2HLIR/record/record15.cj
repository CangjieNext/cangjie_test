// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Test {
    public var t0: Int32 = 0
}

struct RcdTest {
    public var a1: Test = Test()
    public var a3: Test = Test()
}

main(): Int64 {
    var t: RcdTest = RcdTest()
    var temp: Test = t.a1
    t.a3 = temp
    return 0
}
