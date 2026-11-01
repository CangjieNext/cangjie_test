/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

// Same-process mix of std.ast, stdx.syntax and stdx.chir.
// Each statically embeds package flatbuffers; this case covers link+run so
// ELF interposition of those symbols would show up as a crash or wrong result.

import std.ast.{parseDecl, FuncDecl}
import stdx.syntax.parseText
import stdx.chir.*

main() {
    // api from std.ast
    let decl = parseDecl(quote(
        func f() {
            1
        }
    ))
    match (decl as FuncDecl) {
        case Some(_) => ()
        case None => return 1
    }

    // api from stdx.syntax
    let parsed = parseText("func f() { 1 }")
    if (parsed.node.isNone()) {
        return 1
    }

    // api from stdx.chir
    let pkg = Package("pkg.mix", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "f", "f", "pkg.mix")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    bg.entryBlock.appendExpr(Exit.create())
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    if (pkg.toString() != pkg2.toString()) {
        return 1
    }
    return 0
}
