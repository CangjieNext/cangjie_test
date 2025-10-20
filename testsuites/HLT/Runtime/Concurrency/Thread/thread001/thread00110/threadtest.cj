/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not JET) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// (not CJNATIVE) RUN-EXEC-PIPE: export JETVMPROP=-Djet.cj.use.fibers && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is main\nThis is a new thread, sum = 3\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

main(): Int64 {
    print("This is main\n")
    spawn {add(1, 2)}
    sleep(Duration.second);
    if (sum != 3) {
        return 1
    }
    return 0
}
