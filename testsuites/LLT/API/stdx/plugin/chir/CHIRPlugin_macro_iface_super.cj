/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -Woff unused -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// @CHIRPlugin prepends CHIRPluginBase so an existing interface super type is valid

/* SCAN
name: WithIface
ok: true
*/

import stdx.plugin.*
import stdx.chir.*

interface Marker {}

@CHIRPlugin
class WithIface <: Marker {
    public override func run(pkg: Package): Bool {
        let _ = pkg
        true
    }
}

main() {
    let p = WithIface()
    println("name: ${p.name}")
    println("ok: ${p is Marker}")
}
