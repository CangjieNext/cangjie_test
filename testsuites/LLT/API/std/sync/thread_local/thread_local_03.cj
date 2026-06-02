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
    let tl2 = ThreadLocal<String>()
    let fut1 = spawn {
        tl1.set(114)
        for (_ in 0..1000) {
            if (let Some(v) <- tl2.get()) {
                return 1
            }
        }

        return match (tl1.get()) {
            case Some(114) => 0
            case Some(_) => 2
            case None => 3
        }
    }
    let fut2 = spawn {
        tl2.set("The fox")
        for (_ in 0..1000) {
            if (let Some(v) <- tl1.get()) {
                return 1
            }
        }

        return match (tl2.get()) {
            case Some("The fox") => 0
            case Some(_) => 2
            case None => 3
        }
    }
    fut1.get() + fut2.get() * 10
}
