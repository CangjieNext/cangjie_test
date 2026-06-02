// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = """
      struct Data{
          var a : Int32
          var b : Int32
          init(a_: Int32, b_: Int32) {
              this.a = a_
              this.b = b_
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
    let initDecl = (decl as FuncDecl).getOrThrow()
    let initIdent = initDecl.identifier
    if (initIdent.value != "init") {
        return 3;
    }
    let params = initDecl.funcParams
    if (params.size != 2) {
        return 4;
    }
    let body = initDecl.block.nodes
    if (body.size != 2) {
        return 5;
    }
    if ((((body[0] as Expr).getOrThrow()) is AssignExpr) && (((body[1] as Expr).getOrThrow()) is AssignExpr)) {
        return 0;
    } else {
        return 6;
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
