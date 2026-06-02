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
 * Test description: Test the methods of ThreadLocal<T>
 * Test API:
 *      public get(): ?T
 *      public set(value: ?T): Unit
 */

main(): Int64 {
    let tl1 = ThreadLocal<Array<Int64>>()
    let fut1 = spawn {
        tl1.set([0, 1, 2, 3])
        for (_ in 0..1000) {
            if (tl1.get().getOrThrow() != [0, 1, 2, 3]) {
                return 1
            }
        }

        tl1.set(None)
        return match (tl1.get()) {
            case Some(_) => 2
            case None => 0
        }
    }

    let fut2 = spawn {
        tl1.set([1, 2, 3, 4])
        for (_ in 0..1000) {
            if (tl1.get().getOrThrow() != [1, 2, 3, 4]) {
                return 1
            }
        }
        return if (tl1.get().getOrThrow() == [1, 2, 3, 4]) {
            0
        } else {
            1
        }
    }
    fut1.get() + fut2.get() * 10
}
