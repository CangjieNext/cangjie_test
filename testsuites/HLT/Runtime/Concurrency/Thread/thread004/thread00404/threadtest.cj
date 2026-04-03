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
// ASSERT: scan result = 50005000\n
// ASSERT: scan-not Exception

// This test creates a recursion-test with 10000 iterations
// The default stack size is 64KB-cjnatvie / 128KB-cjvm, which is smaller than the need of 10000 iterations
// cjnative could pass by auto stack-expansion
// cjvm doesn't support auto stack-expansion, needs to set stack size explicitly

func test(i: Int64): Int64 {
    if (i == 0) {
        return 0
    }
    return i + test(i - 1)
}

main(): Int64 {
    let fut: Future<Int64> = spawn {
        var c: Int32 = 0
        while (c < 1000) {
            test(10000)
            c = c + 1
        }
        test(10000)
    }

    var result: Int64 = fut.get()
    print("result = ${result}\n")
    return 0
}
