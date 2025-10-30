// DEPENDENCE: sourceFile
// (not Windows) EXEC: dos2unix sourceFile/package1/test_file_input1.cj sourceFile/package1/test_file_input2.cj sourceFile/package2/test_file_input1.cj sourceFile/package2/test_file_input2.cj 
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList
import std.regex.*

@When[os != "Windows"]
const NEWLINE = "\n"
@When[os == "Windows"]
const NEWLINE = "\r\n"

func skipRedundancy(text: String): String {
    var res = ""
    for (i in 0..text.size) {
        let cur = text[i..i + 1]
        if (cur != NEWLINE && cur!= " " && cur != ";") {
            res += cur
        }
    }
    return res
}

@Test
class Test {
    var pkg: ?Package = None
    var inputStr = ArrayList<String>()
    let packageStr = """
// test_file_input1.cj
package www .w .
 w. wx

main(

) : Int64{
  2 + 3

}
// test_file_input2.cj
package www .w .
 w. wx

@Frozen
@Deprecated[ message: "tt" ]
   public func foo<T, w>   (
x: Bool,
  y: Int64, z!: Float64
): Unit  where T <: XX & XX , w <: XX {
    1
    1.0
 foo< Int64  >
 ()
}"""
    @BeforeAll
    func readInput(): Unit {
        let node = parsePackage("./sourceFile/package1")
        if (let Some(val) <- (node.node.getOrThrow() as Package)) {
            pkg = val
        }
        inputStr.add(String.fromUtf8(File.readFrom("sourceFile/package1/test_file_input1.cj")))
        inputStr.add(String.fromUtf8(File.readFrom("sourceFile/package1/test_file_input2.cj")))
    }

    @TestCase
    func test01() {
        if (let Some(val) <- pkg) {
            @Expect(val.srcFile.size, 2)
            @Expect(val.srcFile[0].toString(), inputStr[0])
            @Expect(val.srcFile[1].toString(), inputStr[1])
            var pos = val.nodePos
            @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([0, 0, 0, 0]).toArray())
            @Expect(val.nodePos.fileName, "")
            @Expect(val.nodePos.filePath, "")
            @Expect(val.srcFile[0].nodePos.fileName, "test_file_input1.cj")
            @Expect(val.srcFile[0].nodePos.filePath.contains("/test_file_input1.cj"), true)
            pos = val.srcFile[0].nodePos
            @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 9, 2]).toArray())
            @Expect(val.srcFile[1].nodePos.fileName, "test_file_input2.cj")
            @Expect(val.srcFile[1].nodePos.filePath.contains("/test_file_input2.cj"), true)
            pos = val.srcFile[1].nodePos
            @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 14, 2]).toArray())
        } else {
            @Expect(false)
        }
    }

    @TestCase
    func test02() {
        if (let Some(val) <- pkg) {
            @Expect(val.toString(), packageStr)
            @Expect(skipRedundancy(val.toTokens().toString()), skipRedundancy(packageStr))
        } else {
            @Expect(false)
        }
    }

    @TestCase
    func testPkgNameCheck() {
        try {
            let node = parsePackage("./sourceFile/package2")
        } catch (e: Exception) {
            @Expect(e.message, "ParseException: found more than one package declaration for the package.")
        }
    }

    @TestCase
    func testPkgFailed() {
        let filePath = "./sourceFile/package3/test_file_input1.cj"
        var canPath: String = canonicalize(filePath).toString()
        let r = Regex("(?:\u{001b})[[0-9]*m")
        let hint0 = """
 ==> {file_path_placeholder}:4:1:
  | 
4 | 1 + 1
  | ^ expected declaration here
  | 
  # note: only declarations or macro expressions can be used in the top-level

"""
        let node = parsePackage("./sourceFile/package3")
        @Expect(node.node.isNone())
        let diags = node.diags
        @Expect(diags.size, 1)
        match(diags[0].diagInfo) {
            case Error(err, hint) =>
                @Expect(r.replaceAll(err, ""), "expected declaration, found literal '1'")
                @Expect(r.replaceAll(hint, ""), hint0.replace("{file_path_placeholder}", canPath))
                var pos = diags[0].codePos
                @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([4, 1, 4, 2]).toArray())
                @Expect(pos.fileName, "test_file_input1.cj")
                @Expect(pos.filePath.contains("test_file_input1.cj"))
            case _=> throw Exception("not error")
        }
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
