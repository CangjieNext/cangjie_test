// DEPENDENCE: %n.p1.old.cj %n.p1.new.cj %n.p2.cj
// EXEC: %cpfile %n.p1.old.cj %n.p1.cj
// EXEC: %compiler %incrementalCompile %n.p1.cj %compile_lib_opt -o libp1.%lib_extension 
// EXEC: %compiler %incrementalCompile libp1.%lib_extension %n.p2.cj %compile_lib_opt -o libp2.%lib_extension
// EXEC: %compiler %incrementalCompile libp1.%lib_extension libp2.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.p1.new.cj %n.p1.cj
// EXEC: %compiler %incrementalCompile %n.p1.cj %compile_lib_opt -o libp1.%lib_extension 
// EXEC: %compiler %incrementalCompile libp1.%lib_extension %n.p2.cj %compile_lib_opt -o libp2.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile libp1.%lib_extension libp2.%lib_extension %f -o %output 2>&1 | compare %f
// EXEC-2: %run %run_opt %output %run_args


internal import p2.*

func fat() {
    foo(3)
}
func jom() {
    foo(Int32(3))
}

main() {
    6-fat()-jom()
}

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:fat in file pubimport.cj in line 17 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file pubimport.cj in line 24 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
