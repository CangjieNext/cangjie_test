/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// executeCHIRPlugins：插件 run 返回 false 时 success=false、length=0

/* SCAN
success: false
length: 0
*/

import stdx.plugin.manager.*
import stdx.chir.*

class FailPlugin <: CHIRPluginBase {
    public init() {
        super("FailPlugin")
    }
    public override func run(pkg: Package): Bool {
        let _ = pkg
        return false
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let (data, length) = serializePackage(pkg)
    PluginManager.registerCHIRPlugin({ => FailPlugin() })
    unsafe {
        let result = executeCHIRPlugins(data, length)
        println("success: ${result.success}")
        println("length: ${result.length}")
        freeSerializedMemory()
    }
}
