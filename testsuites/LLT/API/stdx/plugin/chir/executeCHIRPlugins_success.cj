/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// executeCHIRPlugins 成功路径：注册插件后执行并校验结果与反序列化包名

/* SCAN
Running plugin: OkPlugin, pkg: demo
success: true
length > 0: true
pkg: demo
pkg same: true
*/

import stdx.plugin.manager.*
import stdx.chir.*

class OkPlugin <: CHIRPluginBase {
    public init() {
        super("OkPlugin")
    }
    public override func run(pkg: Package): Bool {
        println("Running plugin: ${name}, pkg: ${pkg.name}")
        return true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let (data, length) = serializePackage(pkg)
    PluginManager.registerCHIRPlugin({ => OkPlugin() })
    unsafe {
        let result = executeCHIRPlugins(data, length)
        println("success: ${result.success}")
        println("length > 0: ${result.length > 0}")
        let outPkg = deserializePackage(result.data, result.length)
        println("pkg: ${outPkg.name}")
        println("pkg same: ${pkg.toString() == outPkg.toString()}")
        freeSerializedMemory()
    }
}
