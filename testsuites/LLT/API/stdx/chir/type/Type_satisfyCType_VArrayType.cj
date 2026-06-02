/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// VArrayType：C 兼容元素为 true；非 C 元素为反向 false

/* SCAN
varr i32 satisfyC: true
varr f32 satisfyC: true
varr bool satisfyC: true
varr tuple satisfyC: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let f32 = FloatType.getFloat32()
    let b = BoolType.get()
    println("varr i32 satisfyC: ${VArrayType.get(i32, 4).satisfyCType()}")
    println("varr f32 satisfyC: ${VArrayType.get(f32, 3).satisfyCType()}")
    println("varr bool satisfyC: ${VArrayType.get(b, 2).satisfyCType()}")
    let tup = TupleType.get(Array<Type>(1, { _ => i32 }))
    println("varr tuple satisfyC: ${VArrayType.get(tup, 1).satisfyCType()}")
}
