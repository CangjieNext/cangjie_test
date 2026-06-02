// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package p1

internal import std.ast.*

class ClassVisitor <: Visitor {
    public override func visit(fd: FuncDecl) {
        let ident = fd.identifier
        if (ident.value == "foo") {
            checkAssignmentInFoo(fd)
        }
        return
    }
}

class FuncVisitor <: Visitor {
    public override func visit(vd: VarDecl) {
        println("VarDecl is not allowed in Function foo")
        let tks = quote($vd)
        let pos = tks[1].pos
        reportError(pos)
        return
    }
}

func checkAssignmentInFoo(fd: FuncDecl) {
    let visitor2 = FuncVisitor()
    fd.traverse(visitor2)
}

public macro M1(input: Tokens) {
    println("Compile time M1")
    let decl = parseDecl(input)
    // Traverse the tree to do check.
    let visitor1 = ClassVisitor()
    decl.traverse(visitor1)
    return input
}

func reportError(p: Position) {
    println("source file info:")
    println("fileID: ${p.fileID} line: ${p.line} column: ${p.column}")
    throw Exception("Exceuting Macro Exception")
}

public macro M2(input: Tokens) {
    let fd = (parseDecl(input) as FuncDecl).getOrThrow()

    try {
        let type1 = fd.declType
    } catch (e: Exception) {
        let pos = input[0].pos
        reportError(pos)
    }

    return input
}
