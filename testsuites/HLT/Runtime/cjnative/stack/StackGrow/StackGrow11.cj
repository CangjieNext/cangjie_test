/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (MAC or OHOS) RUN-EXEC: %export cjStackSize=1gb && %run %run_opt %output %run_args
// (not MAC and not OHOS) RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 114
    public var t1: Int32 = 154
}

struct Rcd {
    public var a0: Int64 = 543
    public var a1: Int64 = 123
    public var a3: Test = Test()
}

class TestRcd {
    public var x0: Test = Test()
    public var t0: Rcd = Rcd()
}

var index = 0

main(): Int64 {
    if (testSelfRecursion() != 0) {
        return 1
    }
    // testMutualRecursion()

    return 0
}

func testSelfRecursion(): Int64 {
    var cc = Rcd()
    var cc1 = Rcd()
    var cc2 = Rcd()
    var tr = TestRcd()
    try {
        var i = 19
        stackOverflowTestSub3(i, tr, cc, cc1, cc2)
    } catch (soe: StackOverflowError) {
        print(cc.a3.t1)
        print("-")
        println(cc2.a3.t1)
        print("caught SOE3 in testSelfRecursion\n")
        return 1
    }

    return 0
}

func stackOverflowTestSub3(i: Int64, tr: TestRcd, cc: Rcd, cc1: Rcd, cc2: Rcd): Int64 {
    var x = Rcd()
    x.a3.t1 += cc.a3.t0

    index += 1
    cc1.a3.t0 = cc2.a3.t0 + cc.a3.t0
    if (index < 5000) {
        stackOverflowTestSub3(i, tr, cc, cc1, cc2)
    }
    tr.t0.a3.t0 = cc.a3.t0
    index -= 1
    return x.a0
}
