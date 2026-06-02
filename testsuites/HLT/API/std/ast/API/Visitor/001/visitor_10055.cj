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
// ASSERT: scan ExtendDecl
// ASSERT: scan GenericParam
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan GenericConstraint
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan FuncDecl
// ASSERT: scan PropDecl
// ASSERT: scan Modifier
// ASSERT: scan PrimitiveType
// ASSERT: scan FuncDecl
import std.ast.*

var res = 0

main() {
    let input = quote(
         extend<T> A<T> <: B<T> where T <: C<T>& D<T>{
            func x(){}
            mut prop a : Int64{ get(){} // set(x){}
            }
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
