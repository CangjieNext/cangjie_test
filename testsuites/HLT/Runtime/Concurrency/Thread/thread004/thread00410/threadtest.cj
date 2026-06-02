/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (MAC) RUN-EXEC-PIPE: %export cjStackSize=1gb && %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// (not MAC and not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result1 = 18003000\nresult2 = 18003000\nresult3 = 18003000\nresult4 = 18003000\nresult5 = 18003000\n
// ASSERT: scan-not Exception

// This test creates a recursion-test
// The default stack size is 64KB-cjnatvie / 128KB-cjvm, which is smaller than the need of recursion
// cjnative could pass by auto stack-expansion
// cjvm doesn't support auto stack-expansion, needs to set stack size explicitly

class A {
    public func test(i: Int64): Unit {
        var a: Int64 = 1000
        while (a >= i) {
            a = a - 1
        }
    }
}

func test(i: Int64): Int64 {
    var a: A = A()
    a.test(i)
    if (i == 0) {
        return 0
    }
    return i + test(i - 1)
}

main(): Int64 {
    var fut: Future<Int64> = spawn {
        test(6000)
    }

    var result: Int64 = fut.get()

    print("result1 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    result = fut.get()

    print("result2 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    result = fut.get()

    print("result3 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    result = fut.get()

    print("result4 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    result = fut.get()

    print("result5 = ${result}\n")
    return 0
}
