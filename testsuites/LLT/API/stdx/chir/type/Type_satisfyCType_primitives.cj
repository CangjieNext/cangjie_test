/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 内置数值等与 C ABI 常见类型的 satisfyCType

/* SCAN
i32 satisfyC: true
f32 satisfyC: true
bool satisfyC: true
unit satisfyC: true
*/

import stdx.chir.*

main() {
    println("i32 satisfyC: ${IntType.getInt32().satisfyCType()}")
    println("f32 satisfyC: ${FloatType.getFloat32().satisfyCType()}")
    println("bool satisfyC: ${BoolType.get().satisfyCType()}")
    println("unit satisfyC: ${UnitType.get().satisfyCType()}")
}
