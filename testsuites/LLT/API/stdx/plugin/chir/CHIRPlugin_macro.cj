/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// @CHIRPlugin 宏：自动继承、命名与注册，并可被 executeCHIRPlugins 调用

/* SCAN
name: MyPlugin
Macro plugin processed: demo
result: true
Macro plugin processed: demo
success: true
*/

import stdx.plugin.*
import stdx.chir.*

@CHIRPlugin
class MyPlugin {
    public override func run(pkg: Package): Bool {
        println("Macro plugin processed: ${pkg.name}")
        return true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let plugin = MyPlugin()
    println("name: ${plugin.name}")
    let result = plugin.run(pkg)
    println("result: ${result}")
    let (data, length) = serializePackage(pkg)
    unsafe {
        let execResult = executeCHIRPlugins(data, length)
        println("success: ${execResult.success}")
        freeSerializedMemory()
    }
}
