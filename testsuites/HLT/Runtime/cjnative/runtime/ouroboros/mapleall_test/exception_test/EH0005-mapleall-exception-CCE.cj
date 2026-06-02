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
// ASSERT:scan 103

class CCE {
    public func DoWithString(s: String): Unit {
    }

    public func DoWithInteger(i: Int32): Unit {
    }

    public static func TryCatch(c: Int32): Int32 {
        var r: Int32 = c
        var cce: CCE = CCE()
        try {
            if (c == 0) {
                var s: String = "42"
                cce.DoWithString(s)
            } else {
                var i: Int32 = 42
                cce.DoWithInteger(i)
            }
            r = r + 100
        } catch (e: Exception) {
            r = r + 200
        }
        return r
    }

    public static func TestMain(c: Int32): Int32 {
        return TryCatch(c)
    }
}

main(): Int64 {
    print(CCE.TestMain(3).toString())
    return 0
}
