/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GlobalValue.destroySelf：Function 销毁函数体并标记无效，不修改 Package.functions

/* SCAN
fn body before: true
fn body after: true
fn invalid after: true
pkg fn count unchanged: true
destroySelf twice no crash: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.fn.ds", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "f_ds", "f", "pkg.fn.ds")
    fn.initBody()
    println("fn body before: ${fn.body.isSome()}")

    fn.destroySelf()
    println("fn body after: ${fn.body.isNone()}")
    println("fn invalid after: ${!fn.isFunction()}")
    println("pkg fn count unchanged: ${pkg.functions.size == 1}")

    var noCrash = false
    try {
        fn.destroySelf()
        noCrash = true
    } catch (_: Exception) {
        noCrash = false
    }
    println("destroySelf twice no crash: ${noCrash}")
}
