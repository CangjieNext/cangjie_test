// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p1
// EXEC: %cpfile %n.old.cj p1
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension  %f -o %output
// EXEC: %rmfile p1/%n.old.cj
// EXEC: %cpfile %n.new.cj p1/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %n.new.cj

internal import p1.*
main() {
    A().foo()
}

// ASSERT: scan begin dump raw modified decls:

// ASSERT: scan 1A<:2I1X DeleteExtendMethod2.old.cj 11: body 
// ASSERT: scan     deleted members 1: 2p17Extend!1A<:2I1X3fooF$$Unit 
 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:main in file DeleteExtendMethod2.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:A in file DeleteExtendMethod2.old.cj in line 7 in column 14
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DeleteExtendMethod2.old.cj in line 11 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
