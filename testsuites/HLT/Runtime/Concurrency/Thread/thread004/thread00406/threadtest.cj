/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (MAC) RUN-EXEC-PIPE: %export cjStackSize=1gb && %run %run_opt %output %run_args | compare %f
// (not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result1 = 500500\n
// ASSERT: scan result2 = 2001000\n
// ASSERT: scan result3 = 4501500\n
// ASSERT: scan result4 = 8002000\n
// ASSERT: scan result5 = 12502500\n
// ASSERT: scan-not Exception

// This test creates a recursion-test
// The default stack size is 64KB-cjnatvie / 128KB-cjvm, which is smaller than the need of recursion
// cjnative could pass by auto stack-expansion
// cjvm doesn't support auto stack-expansion, needs to set stack size explicitly

func test(i: Int64): Int64 {
    if (i == 0) {
        return 0
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

    let result1: Int64 = fut1.get()
    let result2: Int64 = fut2.get()
    let result3: Int64 = fut3.get()
    let result4: Int64 = fut4.get()
    let result5: Int64 = fut5.get()

    print("result1 = ${result1}\n")
    print("result2 = ${result2}\n")
    print("result3 = ${result3}\n")
    print("result4 = ${result4}\n")
    print("result5 = ${result5}\n")
    return 0
}
