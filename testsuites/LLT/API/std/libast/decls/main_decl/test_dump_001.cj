// DEPENDENCE: %n.expect
// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt
internal import std.ast.*

main(): Int64 {
    let input = quote(
        main(a: Array<String>):Int64 {
            let score: Int64 = 90
            let PASS = 60
            let FULL = 100
            var scoreResult: String = match (score) {
                case 0 => "zero"
                case 10 | 20 | 30 | 40 | 50 => "fail"
                case PASS => "pass"
                case 70 | 80 => "good"
                case 90 | FULL => "excellent"
                case _ => "not a valid score"
            }
            return 0
        }
    )
    let md = parseDecl(input) as MainDecl
    var maindecl = match (md) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($maindecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (maindecl.keyword.value != "main") {
        return 2
    }
    // Test return type.
    let ty = maindecl.declType
    if (!(ty is PrimitiveType)) {
        return 3
    }

    // Test modifiers.
    let modifiers = maindecl.modifiers
    if (modifiers.size != 0) {
        return 4
    }

    maindecl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
