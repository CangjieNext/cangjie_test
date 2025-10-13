// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p veni veni/vici vidi
// EXEC: %move %n.old.cj p
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o vici/p.%lib_extension --output-dir veni
// EXEC: %compiler veni/vici/p.a %f %incrementalCompile -Woff unused -o %output --output-dir vidi --import-path veni
// EXEC-2: %run %run_opt vidi/%output %run_args
// EXEC: %rmfile p/%n.old.cj
// EXEC: %move %n.new.cj p/%n.old.cj
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o vici/p.%lib_extension --output-dir veni
// EXEC: %compiler veni/vici/p.a %f %incrementalCompile -Woff unused -o %output --output-dir vidi --import-path veni 2>&1 | compare %f
// EXEC-2: %run %run_opt vidi/%output %run_args
// ASSERT: scan B 1p1BS MemberOrder.old.cj 2: memory sig
// ASSERT: scan A 1p1AC MemberOrder.old.cj 6: memory virtual
// ASSERT: scan changed decls to recompile: 10
// ASSERT: scan the changed decl after Spreading is:B in file MemberOrder.old.cj in line 2 in column 15
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 3 in column 16
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 4 in column 17
// ASSERT: scan the changed decl after Spreading is:A in file MemberOrder.old.cj in line 6 in column 19
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 7 in column 19
// ASSERT: scan the changed decl after Spreading is:bar in file MemberOrder.old.cj in line 8 in column 22
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 9 in column 9
// ASSERT: scan the changed decl after Spreading is:foo in file MemberOrder.old.cj in line 11 in column 22
// ASSERT: scan the changed decl after Spreading is:C in file MemberOrder.cj in line 29 in column 7
// ASSERT: scan the changed decl after Spreading is:main in file MemberOrder.cj in line 34 in column 1


internal import p.*

class C <: A {
    public open func foo(): Int64 { 2 }
    public override func bar(): Int64 { 3 }
}

main(): Int64 {
    let c: A = C()
    return c.foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
