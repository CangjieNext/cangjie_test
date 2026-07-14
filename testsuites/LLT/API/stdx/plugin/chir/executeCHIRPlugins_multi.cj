/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// executeCHIRPlugins：多插件按注册顺序执行

/* SCAN
order: P1
order: P2
success: true
*/

import stdx.plugin.manager.*
import stdx.chir.*

class P1 <: CHIRPluginBase {
    public init() {
        super("P1")
    }
    public override func run(pkg: Package): Bool {
        let _ = pkg
        println("order: P1")
        return true
    }
}

class P2 <: CHIRPluginBase {
    public init() {
        super("P2")
    }
    public override func run(pkg: Package): Bool {
        let _ = pkg
        println("order: P2")
        return true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let (data, length) = serializePackage(pkg)
    PluginManager.registerCHIRPlugin({ => P1() })
    PluginManager.registerCHIRPlugin({ => P2() })
    unsafe {
        let result = executeCHIRPlugins(data, length)
        println("success: ${result.success}")
        freeSerializedMemory()
    }
}
