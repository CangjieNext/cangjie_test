/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: scan testABC
// (not O2) ASSERT: scan _test_abc
// (not O2) ASSERT: scan test11abc22
// (not O2) ASSERT: scan test0abc0
// (not O2) ASSERT: scan testABC_test_abctest11abc22test0abc0
// (not O2) ASSERT: scan lambda.
// ASSERT: scan Exception

class A <: Exception {}

func testABC(): Unit {
    throw A()
}

func _test_abc(): Unit {
    testABC()
}

func test11abc22(): Unit {
    _test_abc()
}

func test0abc0(): Unit {
    test11abc22()
}

func testABC_test_abctest11abc22test0abc0(): Unit {
    test0abc0()
}

main() {
    var a: Future<Unit> = spawn {testABC_test_abctest11abc22test0abc0()}
    sleep(Duration.millisecond * 10)

    try {
        let res = a.get()
        print("get something\n")
        throw A()
    } catch (e: Exception) {
        e.printStackTrace()
        print("None\n")
    }
    return 0
}
