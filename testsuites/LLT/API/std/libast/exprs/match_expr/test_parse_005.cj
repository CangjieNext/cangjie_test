// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
            var ret: Int32 = match(pt) {
                case p1: Point1 => p1.x * p1.y
                case _: Point2 => pt.x + pt.y
                case _ => 0
            }
        )

    let varDecl = parseDecl(input)
    let output = quote($varDecl)

    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
