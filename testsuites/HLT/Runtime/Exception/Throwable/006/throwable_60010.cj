/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %compiler %cmp_opt %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: regex test
// (not O2) ASSERT: scan throwable_60010.cj:29
func test() {
    try {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            return 10
        }
    } catch (_) {
        return 5
    } finally {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        }
    }
}

main() {
    var res = test()
    print("success")
    return res - 10
}
