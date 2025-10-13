/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (MAC and not Android) RUN-EXEC-PIPE: %export cjStackSize=1gb && %run %run_opt %output %run_args | compare %f
// (OHOS or Android) RUN-EXEC-PIPE: %export cjStackSize=64mb && %run %run_opt %output %run_args 2>&1 | compare %f
// (CJNATIVE and not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not CJNATIVE)  RUN-EXEC-PIPE: %export JETVMPROP=-Djet.fiber.stack.size=512K %run %run_opt %output %run_args | compare %f
// ASSERT: scan result = 50005000
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
    let fut: Future<Int64> = spawn {
        test(10000)
    }
    var i: Int64 = 0
    while (i < 1000) {
        spawn {
            test(10000)
        }
        i = i + 1
    }

    let result: Int64 = fut.get()
    print("result = ${result}\n")
    return 0
}
