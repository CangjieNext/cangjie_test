// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan success.
main(): Int64 {
    var a = 1
    try {
        a = 2
        try {
            a = 3
            print("success.")
            return a + a
        } catch (_) {
            print("catch A.\n")
        } finally {
            a = 4
            return a + a
        }
    } catch (_) {
        print("catch B.\n")
    } finally {
        a = 5
        return a + a - 10
    }
    return 1
}
