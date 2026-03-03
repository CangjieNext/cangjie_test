/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// RawArrayType：C 兼容元素为 true；非 C 元素为反向 false

/* SCAN
raw i32 satisfyC: false
raw f32 satisfyC: false
raw bool satisfyC: false
raw class satisfyC: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sat.rawneg", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let f32 = FloatType.getFloat32()
    let b = BoolType.get()
    println("raw i32 satisfyC: ${RawArrayType.get(i32, 2).satisfyCType()}")
    println("raw f32 satisfyC: ${RawArrayType.get(f32, 1).satisfyCType()}")
    println("raw bool satisfyC: ${RawArrayType.get(b, 1).satisfyCType()}")
    let cls = pkg.addClass("mRawC", "RawC", true)
    println("raw class satisfyC: ${RawArrayType.get(ClassLikeType.get(cls, Array<Type>()), 1).satisfyCType()}")
}
