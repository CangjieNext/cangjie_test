/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/diag_warning.cj
// (not Windows) EXEC: dos2unix diag_warning.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.unittest.testmacro.*
import std.regex.*

@Test
class Test {
    var diags = Array<Diagnostic>()
    let filePath = "./diag_warning.cj"
    var canPath: String = ""
    let r = Regex("(?:\u{001b})[[0-9]*m")
    let hint1 = """
 ==> {file_path_placeholder}:1:10:
  | 
1 |   let a = 1
  |           ~^ 
  |  _________|
2 | |  + 1
  | |__~ possibly confusing line terminator between '1' and '+'
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff parser`

"""
    @BeforeAll
    func readInput(): Unit {
        let res = parseFile(filePath)
        diags = res.diags
        canPath = canonicalize(filePath).toString().replace("\r\n", "\n")
    }
 
    @TestCase
    func TestCase01(): Unit {
        @Expect(diags.size, 1)
        let diag1 = diags[0].diagInfo
        match(diag1) {
            case Warning(err, hint) =>
                @Expect(r.replaceAll(err, ""), "possibly confusing line terminator")
                @Expect(r.replaceAll(hint, ""), hint1.replace("{file_path_placeholder}", canPath))
            case _=> throw Exception() 
        }
    }
 
}

