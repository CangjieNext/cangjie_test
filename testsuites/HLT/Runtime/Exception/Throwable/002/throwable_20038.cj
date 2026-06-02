/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test() {
    var (a, b, c) = (1, 2, 3)
    try {
        var (d, e, f) = (a, b / (c - a), c)
    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        return d
    }
}

main() {
    test()
    return 0
}
// ASSERT: scan sema_undeclared_identifier
