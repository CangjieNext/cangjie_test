/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan TypeAliasDecl {
// ASSERT: scan   -keyword: Token {
// ASSERT: scan     value: "type"
// ASSERT: scan     kind: TYPE
// ASSERT: scan   }
// ASSERT: scan   -identifier: Token {
// ASSERT: scan     value: "B"
// ASSERT: scan     kind: IDENTIFIER
// ASSERT: scan   }
// ASSERT: scan   -genericParam: GenericParam {
// ASSERT: scan     -parameters: 0, T: Token {
// ASSERT: scan       value: "T"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan     }
// ASSERT: scan  }
// ASSERT: scan   -assign: Token {
// ASSERT: scan     value: "="
// ASSERT: scan     kind: ASSIGN
// ASSERT: scan   }
// ASSERT: scan   -aliasType: RefType {
// ASSERT: scan    -identifier: Token {
// ASSERT: scan      value: "Array"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan     }
// ASSERT: scan     -typeArguments: 0, RefType {
// ASSERT: scan       -identifier: Token {
// ASSERT: scan        value: "T"
// ASSERT: scan        kind: IDENTIFIER
// ASSERT: scan       }
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan }
// ASSERT: scan TypeAliasDecl
// ASSERT: scan GenericParam
// ASSERT: scan RefType
// ASSERT: scan RefType
import std.ast.*

var res = 0

main() {
    let input = quote(
         type B<T> = Array<T>
    )
    let decl = parseDecl(input)
    decl.dump()
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
