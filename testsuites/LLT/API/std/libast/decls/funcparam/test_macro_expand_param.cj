// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 
import std.ast.*
 
main() {
    var input : Tokens = quote(func foo<T> (@!Anno1["1"] @Attribute["12"] a: Int64){
a
})
    var decl1 =  FuncDecl(input)
    println(decl1.toTokens())
    decl1.dump()
    println("decl1.annotations.size: ${decl1.funcParams[0].annotations.size}")
    decl1.funcParams[0].annotations[0].at.dump()
 
}
 
 
// ASSERT: scan func foo < T >(@!Anno1["1"]
// ASSERT: scan @Attribute[12]
// ASSERT: scan a: Int64) {
// ASSERT: scan     a
// ASSERT: scan }
 
/* SCAN-IN
decl1.annotations.size: 2
*/
 
/* SCAN-IN
  -funcParams: 0, FuncParam {
    -annotations: 0, Annotation {
      -identifier: Anno1
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "1"
            kind: STRING_LITERAL
            pos: 7: 53
          }
        }
      }
    }
    -annotations: 1, Annotation {
      -identifier: Attribute
      -attributes: 0,       12: Token {
        value: "12"
        kind: IDENTIFIER
      }
    }
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */