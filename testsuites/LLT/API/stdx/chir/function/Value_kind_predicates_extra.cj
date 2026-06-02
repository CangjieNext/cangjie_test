/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Value：isBlock / isBlockGroup / isFunction（仅 kind 探测）

/* SCAN
result has expr: true
result id is empty: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let lam = Lambda.create(FuncType.get(Array<Type>(), UnitType.get()), "k", "k", ArrayList<GenericType>())
    let result = lam.result
    println("result has expr: ${result.expr == lam}")
    println("result id is empty: ${result.identifier.isEmpty()}")
}
