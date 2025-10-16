/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (MAC) RUN-EXEC-PIPE: %export cjStackSize=1gb && %run %run_opt %output %run_args | compare %f
// (not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

class Test {
    public var t0: Int32 = 114
    public var t1: Int32 = 154
}

struct Rcd {
    public var a0: Int64 = 543
    public var a1: Int64 = 123
    public var a3: Test = Test()
}

var index = 0

main(): Int64 {
    testSelfRecursion()
    // testMutualRecursion()
    print("SOE test done\n")
    return 0
}

func testSelfRecursion(): Int64 {
    var cc = Rcd()
    var cc1 = Rcd()
    var cc2 = Rcd()
    try {
        var i = 19
        stackOverflowTestSub3(i, cc, cc1, cc2)
    } catch (soe: StackOverflowError) {
        print(cc.a3.t1)
        print("-")
        println(cc2.a3.t1)
        print("caught SOE3 in testSelfRecursion\n")
    }

    return 0
}

func stackOverflowTestSub3(i: Int64, cc: Rcd, cc1: Rcd, cc2: Rcd): Int64 {
    var x = Rcd()
    x.a3.t1 += cc.a3.t0

    index += 1
    cc1.a3.t0 = cc2.a3.t0 + cc.a3.t0
    if (index < 5000) {
        stackOverflowTestSub3(i, cc, cc1, cc2)
    }
    index -= 1
    return x.a0
}
// ASSERT: scan SOE test done
