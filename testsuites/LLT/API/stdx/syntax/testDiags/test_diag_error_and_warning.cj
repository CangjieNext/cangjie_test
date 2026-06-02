/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/diag_error_and_warning.cj
// (not Windows) EXEC: dos2unix diag_error_and_warning.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.unittest.testmacro.*
import std.regex.*
import std.collection.ArrayList

@Test
class Test {
    var diags = Array<Diagnostic>()
    let filePath = "./diag_error_and_warning.cj"
    var canPath: String = ""
    let r = Regex("(?:\u{001b})[[0-9]*m")
    let hint0 = """
 ==> {file_path_placeholder}:1:1:
  | 
1 | abc + 1
  | ^^^ expected declaration here
  | 
  # note: only declarations or macro expressions can be used in the top-level

"""

    let hint1 = """
 ==> {file_path_placeholder}:3:10:
  | 
3 |   let a = 1
  |           ~^ 
  |  _________|
4 | |  + 1
  | |__~ possibly confusing line terminator between '1' and '+'
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff parser`

"""
    let hint2 = """
 ==> {file_path_placeholder}:5:10:
  | 
5 | let b = 1$ 1
  |          ^ expected ';' or '<NL>' here
  | 

"""
    @BeforeAll
    func readInput(): Unit {
        let res = parseFile(filePath)
        @Expect(res.node.isNone())
        diags = res.diags
        canPath = canonicalize(filePath).toString().replace("\r\n", "\n")
    }

    @TestCase
    func TestCase01(): Unit {
        @Expect(diags.size, 3)
        match(diags[0].diagInfo) {
            case Error(err, hint) =>
                @Expect(r.replaceAll(err, ""), "expected declaration, found 'abc'")
                @Expect(r.replaceAll(hint, ""), hint0.replace("{file_path_placeholder}", canPath))
                var pos = diags[0].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 1, 4]).toArray())
                @Expect(pos.fileName, "diag_error_and_warning.cj")
                @Expect(pos.filePath.contains("diag_error_and_warning.cj"))
            case _=> throw Exception("not error")
        }
        match(diags[1].diagInfo) {
            case Warning(err, hint) =>
                @Expect(r.replaceAll(err, ""), "possibly confusing line terminator")
                @Expect(r.replaceAll(hint, ""), hint1.replace("{file_path_placeholder}", canPath))
                var pos = diags[1].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 10, 3, 11]).toArray())
                @Expect(pos.fileName, "diag_error_and_warning.cj")
                @Expect(pos.filePath.contains("diag_error_and_warning.cj"))
            case _=> throw Exception("not warning")
        }
        match(diags[2].diagInfo) {
            case Error(err, hint) =>
                @Expect(r.replaceAll(err, ""), "expected ';' or '<NL>', found '$'")
                @Expect(r.replaceAll(hint, ""), hint2.replace("{file_path_placeholder}", canPath))
                var pos = diags[2].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 10, 5, 11]).toArray())
                @Expect(pos.fileName, "diag_error_and_warning.cj")
                @Expect(pos.filePath.contains("diag_error_and_warning.cj"))
            case _=> throw Exception("not error")
        }
    }

}

