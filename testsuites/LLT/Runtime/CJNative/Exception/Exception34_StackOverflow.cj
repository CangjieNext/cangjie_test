// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
/* SCAN
caught SOE3 in testSelfRecursion
caught SOE10 in testSelfRecursion
caught SOE in testMutualRecursion
SOE test done
*/

main(): Int64 {
    testSelfRecursion()
    testMutualRecursion()
    print("SOE test done\n")
    return 0
}

func testSelfRecursion(): Int64 {
    try {
        stackOverflowTestSub3(0, 1, 2)
        ()
    } catch (soe: StackOverflowError) {
        print("caught SOE3 in testSelfRecursion\n")
    }
    try {
        stackOverflowTestSub10(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
        ()
    } catch (soe: StackOverflowError) {
        print("caught SOE10 in testSelfRecursion\n")
    }
    return 0
}

func stackOverflowTestSub3(pad1: Int64, pad2: Int64, pad3: Int64): Int64 {
    var x = pad1 + pad2 + pad3
    print("")
    stackOverflowTestSub3(pad1, pad2, pad3)
    return x
}

func stackOverflowTestSub10(pad1: Int64, pad2: Int64, pad3: Int64, pad4: Int64, pad5: Int64, pad6: Int64, pad7: Int64,
    pad8: Int64, pad9: Int64, pad10: Int64): Int64 {
    var x = pad1 + pad2 + pad3 + pad4
    print("")
    stackOverflowTestSub10(pad1, pad2, pad3, pad4, pad5, pad6, pad7, pad8, pad9, pad10)
    return x
}

func testMutualRecursion(): Int64 {
    try {
        foo(0, 0, 0)
        ()
    } catch (soe: StackOverflowError) {
        print("caught SOE in testMutualRecursion\n")
    }
    return 0
}

func foo(pad1: Int64, pad2: Int64, pad3: Int64): Int64 {
    var x = pad1 + pad2 + pad3
    print("")
    bar(pad1, pad2, pad3)
    return x
}

func bar(pad1: Int64, pad2: Int64, pad3: Int64): Int64 {
    var x = pad1 + pad2 + pad3
    print("")
    baz(pad1, pad2, pad3)
    return x
}

func baz(pad1: Int64, pad2: Int64, pad3: Int64): Int64 {
    var x = pad1 + pad2 + pad3
    print("")
    qux(pad1, pad2, pad3)
    return x
}

func qux(pad1: Int64, pad2: Int64, pad3: Int64): Int64 {
    var x = pad1 + pad2 + pad3
    print("")
    foo(pad1, pad2, pad3)
    return x
}
