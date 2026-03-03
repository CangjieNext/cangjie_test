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
Int32 is numeric type: true
Float32 is numeric type: true
Bool is numeric type: false
*/

import stdx.chir.*

main() {
    let intType = IntType.getInt32()
    let floatType = FloatType.getFloat32()
    let boolType = BoolType.get()
    println("Int32 is numeric type: ${intType.isNumericType()}")
    println("Float32 is numeric type: ${floatType.isNumericType()}")
    println("Bool is numeric type: ${boolType.isNumericType()}")
}
