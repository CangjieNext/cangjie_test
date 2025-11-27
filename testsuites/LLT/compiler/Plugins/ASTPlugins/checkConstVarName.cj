/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package myplugin
import stdx.plugin.*
import stdx.plugin.macros.*
import std.unicode.*
import stdx.syntax.*

@astPlugin[AfterSema]
open class MyASTPlugin  {
    public prop name: String {
        get() {
            "checkConstVarName"
        }
    }

    public override func run(`package`: Package): Bool {
        for (file in `package`.srcFile) {
            for (decl in file.topLevelDecls) {
                if (let v: VarDecl <- decl && let Const <- v.kind) {
                    // check global const var name is all uppercase
                    if (v.name.toUpper() != v.name) {
                        addDiagnostic(Warning("const_var_not_uppercase", "const var name is not all uppercase: ${v.name}, should be ${v.name.toUpper()}"), v.nodePos.filePath, v.nodePos.beginLine, v.nodePos.beginColumn, v.nodePos.endLine, v.nodePos.endColumn)
                        return false
                    }
                }
            }
        }
        println("check const var name is all uppercase success")
        return true
    }
}
