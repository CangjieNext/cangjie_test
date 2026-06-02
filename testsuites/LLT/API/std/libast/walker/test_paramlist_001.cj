// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class MyVisitor <: Visitor {}

main() {
    let input = quote(foreign func CJ_OS_Openc(pathname: CString, flags: Int32, ...): Int32)
    let node = parseDecl(input)
    node.traverse(MyVisitor())
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
