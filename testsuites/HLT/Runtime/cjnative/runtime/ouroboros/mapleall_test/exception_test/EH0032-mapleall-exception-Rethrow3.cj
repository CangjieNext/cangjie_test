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

class Rethrow3 {
    public var x1: Int32 = 0
    public var x2: Int32 = 0

    public Rethrow3() {
        x1 = -1
        x2 = -1
    }

    public func throw_0(): Unit {
        throw Exception()
    }

    public func throw_1(x: Int32): Unit {
        try {
            try {
                throw_0()
            } catch (e: Exception) {
                if (x > 0) {
                    x1 += 133
                    throw e
                } else {
                    x1 += x2
                    x2 += 33
                    throw Exception()
                }
            }
        } catch (e: Exception) {
            throw e
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 0
        var obj: Rethrow3 = Rethrow3()
        try {
            obj.throw_1(c)
        } catch (e: Exception) {
            r = r + c
        }
        return r
    }
}

main(): Int64 {
    print(Rethrow3.TestMain(0).toString() + "\n")
    print(Rethrow3.TestMain(2).toString() + "\n")
    return 0
}
