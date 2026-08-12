/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args
// ASSERT: scan throw exception while running CHIR plugin: ThrowPlugin
// ASSERT: scan success: false
// ASSERT: scan length: 0
// executeCHIRPlugins：插件抛异常时捕获并返回失败

import stdx.plugin.manager.*
import stdx.chir.*

class ThrowPlugin <: CHIRPluginBase {
    public init() {
        super("ThrowPlugin")
    }
    public override func run(pkg: Package): Bool {
        let _ = pkg
        throw Exception("boom")
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let (data, length) = serializePackage(pkg)
    PluginManager.registerCHIRPlugin({ => ThrowPlugin() })
    unsafe {
        let result = executeCHIRPlugins(data, length)
        println("success: ${result.success}")
        println("length: ${result.length}")
        freeSerializedMemory()
    }
}
