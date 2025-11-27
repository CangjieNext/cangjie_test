/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: checkMacroUsage.bad.cj.d checkMacroUsage.code.cj checkMacroUsage.bad.cj
// EXEC: %move checkMacroUsage.bad.cj.d my.cj.d
// EXEC: %compiler %f --output-type=dylib -o libplugin.%dylib_suffix -lstdx.plugin %import-cangjie-stdx
// EXEC: %compiler checkMacroUsage.bad.cj --output-type=dylib -o libmy.%dylib_suffix
// EXEC-PIPE-1: %compiler --plugin=libplugin.%dylib_suffix checkMacroUsage.code.cj -L. -lmy --import-path . %cmp_opt %compile_lib_opt %import-cangjie-stdx 2>&1 | compare %f

package myplugin
import stdx.plugin.*
import stdx.syntax.*
import std.fs.*
import std.collection.*

open class MyASTPlugin <: ASTPlugin {
    public prop name: String {
        get() {
            "checkDeriveInCjd"
        }
    }

    func checkDecl(path: String, decl: MacroExpandDecl): Bool {
        if (let Some(r: SymbolRef) <- (decl.calleeMacro as SymbolRef)) {
            if (r.name == "Derive") {
                addDiagnostic(DiagnosticInfo.Error("derive_in_cjd", "@Derive is not allowed in .cj.d"), path, r.nodePos.beginLine, r.nodePos.beginColumn, r.nodePos.endLine, r.nodePos.endColumn)
            }
            if (let WithoutParens(inner) <- decl.macroInputs && let Some(innerMacro: MacroExpandDecl) <- (inner as MacroExpandDecl)) {
                checkDecl(path, innerMacro)
            }
        }
        return true
    }

    func checkFile(path: String, file: SourceFile) {
        for (decl in file.topLevelDecls) {
            if (let Some(m: MacroExpandDecl) <- (decl as MacroExpandDecl)) {
                checkDecl(path, m)
            }
        }
    }

    public override func run(`package`: Package): Bool {
        for (file in `package`.srcFile) {
            checkFile(file.path, file)
        }

        let opts = getCompilerOptions()
        let checkedCjd = HashSet<String>()
        for (dir in opts.importPaths) {
            Directory.walk(dir, { info =>
                if (info.isRegular() && info.path.toString().endsWith(".cj.d")) {
                    let name = info.name
                    if (checkedCjd.contains(name)) {
                        return true
                    }
                    checkedCjd.add(name)
                    let parseResult = parseCjdFile(info.path.toString())
                    if (let Some(node) <- parseResult.node) {
                        checkFile(name, node)
                    }
                }
                true
            })
        }
        return true
    }
}

@C public func registerPlugin() {
    registerASTPlugin({ => MyASTPlugin()}, BeforeMacro)
}

// ASSERT: scan-2 error: derive_in_cjd: @Derive is not allowed in .cj.d
// ASSERT: scan ==> my.cj.d:12:2:
// ASSERT: scan ==> my.cj.d:20:2: