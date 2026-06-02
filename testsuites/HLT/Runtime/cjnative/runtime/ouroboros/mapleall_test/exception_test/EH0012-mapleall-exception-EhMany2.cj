/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10002

class E888_E <: Exception {}

class E999_E <: Exception {}

class E123_E <: Exception {}

class E456_234_123 <: Exception {}

class E234_123 <: Exception {}

class EhMany {
    public static func xxx(): Unit {
        throw E123_E()
    }

    public static func yyy(): Unit {
    }

    public static func TryCatch(n: Int32): Int32 {
        var m: Int32 = 0
        try {
            m += 1
            if (n > 100) {
                xxx()
            } else if (n > 50) {
                throw E999_E()
            } else {
                yyy()
            }
        } catch (e: E456_234_123) {
            m += 100
        } catch (e: E234_123) {
            m += 1000
        } catch (e: E123_E) {
            m += 10000
        } catch (e: E999_E) {
            m += 100000
        }
        m += 1
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
