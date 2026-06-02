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
    let arr = Array<ThreadLocal<Int64>>(10, {i => ThreadLocal<Int64>()})
    let fut = spawn {
        for (i in 0..arr.size) {
            let tl = arr[i]
            if (let Some(v) <- tl.get()) {
                return 1
            }
            tl.set(i)
        }
        for (i in 0..arr.size) {
            let tl = arr[i]
            match (tl.get()) {
                case Some(v) =>
                    if (v == i) {
                        tl.set(100 + i)
                    } else {
                        return 2
                    }
                case None => return 3
            }
        }
        for (i in 0..arr.size) {
            let tl = arr[i]
            match (tl.get()) {
                case Some(v) =>
                    if (v == 100 + i) {
                        tl.set(None)
                    } else {
                        return 4
                    }
                case None => return 5
            }
        }
        return 0
    }
    fut.get()
}
