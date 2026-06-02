// DEPENDENCE: ./test_program_001_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan file
// ASSERT: scan packageSpec
// ASSERT: scan importSpec

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

class MyVisitor <: Visitor {
    public override func visit(file: Program) {
        println("file ")
        return
    }
    public override func visit(pkg: PackageHeader) {
        println("packageSpec ")
        return
    }

    public override func visit(imp: ImportList) {
        println("importSpec")
        return
    }
}

main(): Int64 {
    let path: String = "./test_program_001_dep.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()

    let tokens: Tokens = cangjieLex(code)
    let fileNode = parseProgram(tokens)
    let myVisitor = MyVisitor()
    fileNode.traverse(myVisitor)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
