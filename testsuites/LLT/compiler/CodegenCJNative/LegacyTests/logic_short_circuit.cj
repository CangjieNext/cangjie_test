// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan-begin test1
// ASSERT: scan-next branch& 2
// ASSERT: scan-next test1
// ASSERT: scan-next test2
// ASSERT: scan-next branch| 1
// ASSERT: scan-next test3
// ASSERT: scan-next test3
// ASSERT: scan-next true

func test1(i: Int32): Bool {
    print("test1\n")
    return i > 4;
}

func test2(i: Int32): Bool {
    print("test2\n")
    return i > 2;
}

func test3(i: Int32): Bool {
    print("test3\n")
    return i > 5;
}

main(): Int64 {
    if (test1(2) && test2(3) && test3(4)) {
        print("branch& 1\n")
    } else {
        print("branch& 2\n")
    }

    if (test1(2) || test2(3) || test3(4)) {
        print("branch| 1\n")
    } else {
        print("branch| 2\n")
    }

    if (test3(1)) {}
    if (test3(6)) {
        print("true\n")
    } else {
        print("false\n")
    }
    return 0
}
