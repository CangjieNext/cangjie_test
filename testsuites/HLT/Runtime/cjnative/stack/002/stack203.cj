/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2 and not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not O2 and not iOS) RUN-EXEC-PIPE: %export cjStackSize=64kb && %export CJ_SOF_SIZE=0 && %run %run_opt %output %run_args 2> log.txt && grep -E "An exception has occurred|StackOverflowError|stack203.cj|at default.main" log.txt | compare %f

// ASSERT: scan-begin An exception has occurred
// ASSERT: scan-after StackOverflowError
// (not OHOS) ASSERT: scan-after at default.my_test_func
// (not Windows or OHOS) ASSERT: scan-after at default.main

import std.collection.*

struct Test {
    public var t0: Int64 = 114
    public var t1: Int64 = 154
    public var t2: Int64 = 154
    public var t3: Int64 = 154
    public var t4: Int64 = 154
    public var t5: Int64 = 154
    public var t6: Int64 = 154
    public var t7: Int64 = 154
    public var t8: Int64 = 154
    public var t9: Int64 = 154
}

struct Rcd {
    public var a0: Int64 = 543
    public var a1: Int64 = 123
    public var a3: Test = Test()
    public var a4: Test = Test()
    public var a5: Test = Test()
    public var a6: Test = Test()
    public var a7: Test = Test()
    public var a8: Test = Test()
    public var a9: Test = Test()
}

func my_test_func(x: Int64): Unit {
    var cc = Rcd()
    var cc1 = Rcd()
    var cc2 = Rcd()
    var cc3 = Rcd()
    var cc4 = Rcd()
    var cc5 = Rcd()

    var a = Rcd()
    a.a3.t1 += cc.a3.t0
    var a1 = Rcd()
    a1.a3.t1 += cc1.a3.t0
    var a2 = Rcd()
    a2.a3.t1 += cc2.a3.t0
    var a3 = Rcd()
    a3.a3.t1 += cc3.a3.t0
    var a4 = Rcd()
    a4.a3.t1 += cc4.a3.t0
    var a5 = Rcd()
    a5.a3.t1 += cc5.a3.t0

    my_test_func(x + 1)
}

main() {
    try {
        my_test_func(0)
    } catch (e: StackOverflowError) {
        e.printStackTrace()
    }
    return
}
