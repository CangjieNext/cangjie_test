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
generic class added: GenCls
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.gen", AccessLevel.Public)
    let g = GenericType.get("pkgGenT", "T")
    let genParams = Array<GenericType>(1, { _ => g })
    let genClass = pkg.addClass("GenCls", "GenCls", true, genericTypeParams: genParams)
    println("generic class added: ${genClass.srcCodeName}")
}
