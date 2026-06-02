/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 1

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class ThrowPassedException {
    public ThrowPassedException() {
    }

    public func allocate_exception(): Exception {
        return E456_234_123()
    }

    public func throw_exception(e: Exception): Unit {
        throw e
    }

    public static func TestMain(c: Int32): Int32 {
        var r: Int32 = 0
        var tpe: ThrowPassedException = ThrowPassedException()
        var e: Exception = tpe.allocate_exception()
        try {
            tpe.throw_exception(e)
        } catch (e0: E456_234_123) {
            r = 1
        } catch (e1: E123_E) {
            r = -100
        } catch (e2: Exception) {
            r = -1000
        }
        return r
    }
}

main(): Int64 {
    print(ThrowPassedException.TestMain(0))
    return 0
}
