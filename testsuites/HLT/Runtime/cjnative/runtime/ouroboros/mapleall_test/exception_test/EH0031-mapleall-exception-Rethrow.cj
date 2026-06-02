/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
0
2
 */

class Rethrow {
    public func throw_0(): Unit {
        throw Exception()
    }

    public func throw_1(): Unit {
        try {
            throw_0()
        } catch (e: Exception) {
            throw e
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 0
        var obj: Rethrow = Rethrow()
        try {
            obj.throw_1()
        } catch (e: Exception) {
            r = r + c
        }
        return r
    }
}

main(): Int64 {
    print(Rethrow.TestMain(0).toString() + "\n")
    print(Rethrow.TestMain(2).toString() + "\n")
    return 0
}
