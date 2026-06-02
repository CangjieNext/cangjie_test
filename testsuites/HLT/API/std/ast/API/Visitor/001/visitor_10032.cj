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
// ASSERT: scan FuncDecl
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr
// ASSERT: scan TypeConvExpr
// ASSERT: scan PrimitiveType
// ASSERT: scan LitConstExpr

import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){

            Int64(1)
            Int32(1)
            Int16(1)
            Int8(1)
            UInt64(1)
            UInt32(1)
            UInt16(1)
            UInt8(1)
            Float64(1)
            Float32(1)
            Float16(1)
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
