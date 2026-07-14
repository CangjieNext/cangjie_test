/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CHIRPluginBase.name / run

/* SCAN
MyPlugin
Plugin MyPlugin processed package: demo
result: true
*/

import stdx.plugin.manager.*
import stdx.chir.*

class MyPlugin <: CHIRPluginBase {
    public init() {
        super("MyPlugin")
    }
    public override func run(pkg: Package): Bool {
        println("Plugin ${name} processed package: ${pkg.name}")
        return true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let plugin = MyPlugin()
    println(plugin.name)
    let result = plugin.run(pkg)
    println("result: ${result}")
}
