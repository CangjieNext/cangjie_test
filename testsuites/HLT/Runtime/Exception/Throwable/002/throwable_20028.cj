/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception
// ASSERT: scan throwable_20028.cj:19

struct B {
    public static var b = test(1)
    public static func test(x: Int64):Unit {
        try {
            throw Exception();
            ()
        } catch (e: Exception) {
            print(e.message)
            print(e.toString())
            e.printStackTrace()
        }
    }
}

main() {
    B.test(1)
    return 0
}
