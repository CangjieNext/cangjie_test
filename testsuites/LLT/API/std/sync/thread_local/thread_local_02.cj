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
    let tl1 = ThreadLocal<Int64>()
    let fut = spawn {
        tl1.set(42)
        tl1.set(None)
        if (let Some(v) <- tl1.get()) {
            return 1
        }

        tl1.set(24)
        return match (tl1.get()) {
            case Some(24) => 0
            case Some(_) => 2
            case None => 3
        }
    }
    fut.get()
}
