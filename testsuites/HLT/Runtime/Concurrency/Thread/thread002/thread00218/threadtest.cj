/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// ( not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f

// ASSERT: scan error\nresult = 0\n
// ASSERT: scan-not Exception

@OverflowWrapping
main(): Int64 {
    var result: UInt16 = 65535

    let fut: Future<UInt16> = spawn {
        var a: UInt16 = 65535
        sleep(Duration.millisecond * 10)
        return a + 1
    }
    try {
        result = fut.get(Duration.nanosecond * 1)
    } catch (e: Exception) {
        print("error\n")
    }

    try {
        result = fut.get(Duration.second)
    } catch (e: Exception) {
        print("error\n")
    }

    if (result != 0) {
        return 1
    }

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    print("result = ${result}\n")
    return 0
}
