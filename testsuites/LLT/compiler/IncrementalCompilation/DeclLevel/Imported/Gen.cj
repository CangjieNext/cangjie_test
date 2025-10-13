// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p veni veni/vici vidi
// EXEC: %move %n.old.cj p
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o vici/p.%lib_extension --output-dir veni
// EXEC: %compiler veni/vici/p.a %f %incrementalCompile -Woff unused -o %output --output-dir vidi --import-path veni
// EXEC: %run %run_opt vidi/%output %run_args
// EXEC: %rmfile p/%n.old.cj
// EXEC: %move %n.new.cj p/%n.old.cj
// EXEC: %compiler -p p %incrementalCompile -Woff unused --output-type=staticlib -o vici/p.%lib_extension --output-dir veni
// EXEC-PIPE: %compiler veni/vici/p.a %f %incrementalCompile -Woff unused -o %output --output-dir vidi --import-path veni 2>&1 | compare %f
// EXEC-1: %run %run_opt vidi/%output %run_args
// ASSERT: scan A 1p1A<1>C Gen.old.cj 3: memory
// ASSERT: scan IB 1p2IB<1>I Gen.old.cj 8: virtual
// ASSERT: scan changed decls to recompile: 11
// ASSERT: scan the changed decl after Spreading is:init in file Gen.old.cj in line 0 in column 0
// ASSERT: scan the changed decl after Spreading is:A in file Gen.old.cj in line 3 in column 14
// ASSERT: scan the changed decl after Spreading is:c in file Gen.old.cj in line 4 in column 17
// ASSERT: scan the changed decl after Spreading is:d in file Gen.old.cj in line 5 in column 19
// ASSERT: scan the changed decl after Spreading is:IB in file Gen.old.cj in line 8 in column 18
// ASSERT: scan the changed decl after Spreading is:foo in file Gen.old.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:k in file Gen.old.cj in line 10 in column 10
// ASSERT: scan the changed decl after Spreading is:$kget in file Gen.old.cj in line 11 in column 9
// ASSERT: scan the changed decl after Spreading is:foo in file Gen.old.cj in line 15 in column 6
// ASSERT: scan the changed decl after Spreading is:bar in file Gen.old.cj in line 17 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file Gen.cj in line 31 in column 1
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:1p1A<1>C1dV$$Int64


internal import p.*
main(): Int64 {
    bar<Int32>()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
