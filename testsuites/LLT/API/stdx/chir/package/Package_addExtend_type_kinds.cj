/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// addExtend：扩展 CustomType；以及既非 Builtin 也非 Custom 的类型（如 FuncType）

/* SCAN
extend class ok: true
extend class on def: true
extend funcTy ok: true
extend funcTy not on class: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.ext.ty", AccessLevel.Public)
    let cls = pkg.addClass("C", "C", true)
    let clsTy = cls.ty

    let extOnClass = pkg.addExtend("extC", clsTy)
    println("extend class ok: ${extOnClass.extendedType == clsTy}")
    println("extend class on def: ${cls.extends.size == 1 && cls.extends[0] == extOnClass}")

    // FuncType 既非 BuiltinType 也非 CustomType，走 createExtendDef 的 else-if 失败分支
    let fty = FuncType.get(Array<Type>(), UnitType.get())
    let extOnFunc = pkg.addExtend("extF", fty)
    println("extend funcTy ok: ${extOnFunc.extendedType == fty}")
    println("extend funcTy not on class: ${cls.extends.size == 1}")
}
