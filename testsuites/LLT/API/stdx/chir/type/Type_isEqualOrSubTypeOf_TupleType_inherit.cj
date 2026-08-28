/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isEqualOrSubTypeOf：Tuple 元素为继承关系；Tuple 与非 Tuple

/* SCAN
tuple inherit sub: true
tuple vs nonTuple: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.sub.tup", AccessLevel.Public)
    let base = pkg.addClass("mBase", "Base", true)
    let sub = pkg.addClass("mSub", "Sub", true)
    sub.superClass = Some(base.classType)

    let tSub = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            sub.classType
        } else {
            BoolType.get()
        }
    }))
    let tBase = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            base.classType
        } else {
            BoolType.get()
        }
    }))
    println("tuple inherit sub: ${tSub.isEqualOrSubTypeOf(tBase)}")
    println("tuple vs nonTuple: ${tSub.isEqualOrSubTypeOf(i32)}")
}
