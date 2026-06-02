/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test thread cancellation
 * Test API:
 *   - Thread.hasPendingCancellation
 */

main(): Int64 {
    let flag = Thread.currentThread.hasPendingCancellation
    if (flag) {
        return 1
    } else {
        return 0
    }
}
