/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
i32 hash stable: true
tuple hash stable: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let h1 = i32.hashCode()
    let h2 = i32.hashCode()
    println("i32 hash stable: ${h1 == h2}")

    let tup = TupleType.get(Array<Type>(1, { _ => i32 }))
    println("tuple hash stable: ${tup.hashCode() == tup.hashCode()}")
}
