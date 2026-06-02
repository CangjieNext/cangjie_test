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
110
112
 */

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class RethrowFlush {
    public var x1: Int32 = 0

    public RethrowFlush() {
        x1 = -1
    }

    public func throw_0(): Unit {
        throw E123_E()
    }

    public func throw_1(): Unit {
        try {
            throw_0()
        } finally {
            try {
                throw Exception()
            } catch (e: Exception) {
                x1 += 111
            }
        }
    }

    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 0
        var obj: RethrowFlush = RethrowFlush()
        try {
            obj.throw_1()
        } catch (e: E123_E) {
            r = r + c + obj.x1
        } catch (e: Exception) {
            r = r + c + obj.x1 + 100
        }
        return r
    }
}

main(): Int64 {
    print(RethrowFlush.TestMain(0).toString() + "\n")
    print(RethrowFlush.TestMain(2).toString() + "\n")
    return 0
}
