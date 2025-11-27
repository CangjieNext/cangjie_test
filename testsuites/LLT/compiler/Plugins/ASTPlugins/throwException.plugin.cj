/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package plugin
import stdx.plugin.*
import stdx.syntax.*

public open class MyASTPlugin <: ASTPlugin {
    public override prop name: String {
        get() {
            "throw"
        }
    }
    public override func run(`package`: Package): Bool {
        throw Exception("throw exception test")
    }
}

@C public func registerPlugin() {
    registerASTPlugin({ => MyASTPlugin()}, AfterSema)
}