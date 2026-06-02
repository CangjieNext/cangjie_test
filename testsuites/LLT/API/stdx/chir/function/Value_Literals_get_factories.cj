/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 各 Literal 的 public static get 与 toString

/* SCAN
bool rune int float unit null str: true true true true true true true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let f64 = FloatType.getFloat64()
    let pkg = Package("pkg.lit", AccessLevel.Public)
    pkg.addImportedStruct("symStr", "String", "std.core")
    let strTy = pkg.getSpecifiedStructDef("std.core", "String").getOrThrow().structType
    let sl = StringLiteral.get(strTy, "hi")
    println(
        "bool rune int float unit null str: ${BoolLiteral.get(false).value == false} ${RuneLiteral.get(Rune(88)).value == Rune(88)} ${IntLiteral.get(i32, 9u64).unsignedValue == 9u64} ${FloatLiteral.get(f64, 2.5).value == 2.5} ${UnitLiteral.get().toString() == "Unit"} ${NullLiteral.get(i32).ty == i32} ${sl.value == "hi"}"
    )
}
