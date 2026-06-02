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
// ASSERT:scan 290

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class EhMany {
    public static func xxx(): Unit {
        throw E123_E()
    }

    public static func dumpcall(): Unit {
    }

    public static func TryCatch(n: Int32): Int32 {
        var m: Int32 = 0
        try {
            m += 1
            if (n > 100) {
                throw E234_123()
            } else if (n > 50) {
                throw E999_E()
            } else {
                xxx()
            }
        } catch (e: E456_234_123) {
            m += 100
        } catch (e: E234_123) {
            m += 200
            if (n > 0) {
                dumpcall()
            } else {
                m += 555
            }
        } catch (e: E999_E) {
            m += 300
        }
        m += 1
        try {
            m += 20
            if (n > 120) {
                throw E234_123()
            } else {
                throw E999_E()
            }
        } catch (e: E999_E) {
            m += 48
        } catch (e: E456_234_123) {
            m += 58
        } catch (e: E234_123) {
            m += 68
        }
        return m
    }

    public static func TestMain(c: Int32): Int32 {
        return TryCatch(c)
    }
}

main(): Int64 {
    print(EhMany.TestMain(123))
    return 0
}
