/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isEqualOrInstantiatedTypeOf 见 Type_isEqualOrInstantiatedTypeOf_*.cj

/* SCAN
g genericRelated: true
tuple nested genericRelated: true
i32 genericRelated: false
*/

import stdx.chir.*

main() {
    let g = GenericType.get("gRel", "T")
    let tup = TupleType.get(Array<Type>(1, { _ => g }))
    println("g genericRelated: ${g.isGenericRelated()}")
    println("tuple nested genericRelated: ${tup.isGenericRelated()}")
    println("i32 genericRelated: ${IntType.getInt32().isGenericRelated()}")
}
