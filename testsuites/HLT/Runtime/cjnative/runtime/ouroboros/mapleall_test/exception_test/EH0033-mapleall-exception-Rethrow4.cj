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
710409
730430
 */

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class Rethrow4 {
    public var x1: Int32 = 0
    public var x2: Int32 = 0

    public Rethrow4() {
        x1 = -1
        x2 = -1
    }

    public func throw_0(x: Int32): Unit {
        if (x != 0) {
            throw E456_234_123()
        }
    }

    public func throw_1(x: Int32): Unit {
        try {
            try {
                throw_0(x)
            } catch (e: E456_234_123) {
                if (x == 1) {
                    x1 += 10
                    x2 += 10000
                    throw e
                } else {
                    x1 += 30
                    x2 += 30000
                    throw e
                }
            }
        } catch (e: Exception) {
            x1 += 400
            x2 += 700000
            throw e
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 0
        var obj: Rethrow4 = Rethrow4()
        try {
            r = c
            obj.throw_1(c)
        } catch (e: E456_234_123) {
            r = obj.x1 + obj.x2 + c
        } catch (e: Exception) {
            r = -1001
        }
        return r
    }
}

main(): Int64 {
    print(Rethrow4.TestMain(0).toString() + "\n")
    print(Rethrow4.TestMain(1).toString() + "\n")
    print(Rethrow4.TestMain(2).toString() + "\n")
    return 0
}
