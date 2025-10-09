/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// (MAC) RUN-EXEC-PIPE: %export cjStackSize=1gb && %run %run_opt %output %run_args | compare %f
// (CJNATIVE and not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not CJNATIVE)  RUN-EXEC-PIPE: %export JETVMPROP=-Djet.fiber.stack.size=1M %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception1 occured: Exception
// ASSERT: scan Exception2 occured: Exception
// ASSERT: scan Exception3 occured: Exception
// ASSERT: scan Exception4 occured: Exception
// ASSERT: scan Exception5 occured: Exception
// ASSERT: scan result1 = 0\n
// ASSERT: scan result2 = 0\n
// ASSERT: scan result3 = 0\n
// ASSERT: scan result4 = 0\n
// ASSERT: scan result5 = 0\n

// This test creates a recursion-test
// The default stack size is 64KB-cjnatvie / 128KB-cjvm, which is smaller than the need of recursion
// cjnative could pass by auto stack-expansion
// cjvm doesn't support auto stack-expansion, needs to set stack size explicitly

class A <: Exception {}

func test(i: Int64): Int64 {
    if (i == 0) {
        throw A()
    }
    return i + test(i - 1)
}

main(): Int64 {
    let fut1: Future<Int64> = spawn {
        test(1000)
    }

    let fut2: Future<Int64> = spawn {
        test(2000)
    }

    let fut3: Future<Int64> = spawn {
        test(3000)
    }

    let fut4: Future<Int64> = spawn {
        test(4000)
    }

    let fut5: Future<Int64> = spawn {
        test(5000)
    }

    var result1: Int64 = 0
    var result2: Int64 = 0
    var result3: Int64 = 0
    var result4: Int64 = 0
    var result5: Int64 = 0
    try {
        result1 = fut1.get()
    } catch (e: Exception) {
        print("Exception1 occured: ${e}\n")
    }
    try {
        result2 = fut2.get()
    } catch (e: Exception) {
        print("Exception2 occured: ${e}\n")
    }
    try {
        result3 = fut3.get()
    } catch (e: Exception) {
        print("Exception3 occured: ${e}\n")
    }
    try {
        result4 = fut4.get()
    } catch (e: Exception) {
        print("Exception4 occured: ${e}\n")
    }
    try {
        result5 = fut5.get()
    } catch (e: Exception) {
        print("Exception5 occured: ${e}\n")
    }
    print("result1 = ${result1}\n")
    print("result2 = ${result2}\n")
    print("result3 = ${result3}\n")
    print("result4 = ${result4}\n")
    print("result5 = ${result5}\n")
    return 0
}
