// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 0
}

open class Father {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var a3: Test = Test()
}

main(): Int64 {
    var t = Father()
    var temp: Test = t.a1
    temp.t0 = 1
    t.a1 = t.a3
    t.a3 = temp

    if (temp.t0 == 1) {
        return 0
    }
    return 1
}
