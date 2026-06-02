/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test the methods of ThreadLocal<T> when resize() is called
 * Test API:
 *      public get(): ?T
 *      public set(value: ?T): Unit
 */

main(): Int64 {
    let tlArr = Array<ThreadLocal<Int64>>(20, {i => ThreadLocal<Int64>()})

    for (i in 0..8) {
        tlArr[i].set(i)
    }
    for (i in 0..8) {
        match (tlArr[i].get()) {
            case Some(v) =>
                if (v != i) {
                    return 1
                }
            case None => return 2
        }
    }

    for (i in 8..20) {
        tlArr[i].set(i)
    }
    for (i in 0..20) {
        match (tlArr[i].get()) {
            case Some(v) =>
                if (v != i) {
                    return 3
                }
            case None => return 4
        }
    }

    0
}
