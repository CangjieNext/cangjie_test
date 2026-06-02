/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_file_input.cj
// (not Windows) EXEC: dos2unix test_file_input.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*

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
    var file: ?SourceFile = None

    @BeforeAll
    func readInput(): Unit {
        let node = parseFile("test_file_input.cj")
        if (let Some(val) <- (node.node.getOrThrow() as SourceFile)) {
            file = val
        }
    }

    @TestCase
    func test01() {
        let input = String.fromUtf8(File.readFrom("test_file_input.cj"))
        @Expect(file?.toString(), input)
        @Expect(skipRedundancy(file.getOrThrow().toTokens().toString().replace("\r\n", "\n")), skipRedundancy(input.replace("\r\n", "\n")))
    }

    @TestCase
    func test02() {
        if (let Some(val) <- file) {
            @Expect(val.topLevelDecls.size, 4)
            if (let Some(fd) <- (val.topLevelDecls[0] as FuncDecl)) {
                @Expect(fd.name, "foo")
                @Expect(skipRedundancy(fd.toTokens().toString().replace("\r\n", "\n")), skipRedundancy(fd.toString().replace("\r\n", "\n")))
            }
        } else {
            @Expect(false)
        }
    }

    @TestCase
    func testInit01() {
        if (let Some(f) <- file) {
            let sourceFile = SourceFile(f.importLists, f.name, f.path, f.pkgHeader, f.topLevelDecls)
            @Expect(sourceFile.topLevelDecls.size, 4)
            if (let Some(fd) <- (sourceFile.topLevelDecls[0] as FuncDecl)) {
                @Expect(fd.name, "foo")
            }
        } else {
            @Expect(false)
        }
    }
}

