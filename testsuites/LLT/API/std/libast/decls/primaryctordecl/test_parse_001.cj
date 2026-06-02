// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = """
      struct Data{
          var x = 1
          var y = 2
          Data(var a:Int32, var b:Int32) {

          }
      }"""
    let structTokens = cangjieLex(code)
    let structDecl = (parseDecl(structTokens) as StructDecl).getOrThrow()
    let ident = structDecl.identifier
    if (ident.value != "Data") {
        return 1;
    }
    let decls = structDecl.body.decls
    if (decls.size != 3) {
        return 2;
    }
    let decl = decls[2]
    let primary = (decl as PrimaryCtorDecl).getOrThrow()

    let primaryIdent = primary.identifier
    if (primaryIdent.value != "Data") {
        return 2
    }

    let params = primary.funcParams
    if (params.size != 2) {
        return 3;
    }

    let param1 = params[0]
    let ident1 = param1.identifier.value
    let type1 = (param1.paramType as PrimitiveType).getOrThrow().keyword.value
    if (ident1 != "a" || type1 != "Int32") {
        return 4
    }

    let param2 = params[1]
    let ident2 = param2.identifier.value
    let type2 = (param2.paramType as PrimitiveType).getOrThrow().keyword.value
    if (ident2 != "b" || type2 != "Int32") {
        return 5
    }

    if (primary.lParen.kind == ILLEGAL) {
        return 6
    }
    if (primary.rParen.kind == ILLEGAL) {
        return 7;
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
