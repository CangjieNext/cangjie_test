// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %cpfile %n.old.cj lib.cj
// EXEC: %cpfile %f main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj lib.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension > %redirectNull
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

internal import inc.*

main(): Unit {

}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added 2SB<1A1B><:2IE<1A1B2IE<1A1Bi>>X at 27,1
// ASSERT: scan added 2EB<1T><:2IAX at 32,1
// ASSERT: scan deleted 2EB<1T><:2IE<1T1T2IE<1T1T1T>>X
// ASSERT: scan deleted 2SB<1A1B><:2IC<1B>X
// ASSERT: scan deleted 3inc7Extend!2EB<1T><:2IE<1T1T2IE<1T1T1T>>X3fooF$$Int64
// ASSERT: scan deleted 3inc7Extend!2SB<1A1B><:2IC<1B>X3fooF$$Int64
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 9
// ASSERT: scan the changed decl after Spreading is:init in file lib.cj in line 0 in column 0
// ASSERT: scan the changed decl after Spreading is:SB in file lib.cj in line 22 in column 15
// ASSERT: scan the changed decl after Spreading is:EB in file lib.cj in line 23 in column 13
// ASSERT: scan the changed decl after Spreading is:R in file lib.cj in line 24 in column 5
// ASSERT: scan the changed decl after Spreading is:K in file lib.cj in line 24 in column 9
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 27 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file lib.cj in line 28 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 32 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file lib.cj in line 33 in column 17
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:2EB<1T><:2IE<1T1T2IE<1T1T1T>>X
// ASSERT: scan the deleted decl is:3inc7Extend!2EB<1T><:2IE<1T1T2IE<1T1T1T>>X3fooF$$Int64
// ASSERT: scan the deleted decl is:2SB<1A1B><:2IC<1B>X
// ASSERT: scan the deleted decl is:3inc7Extend!2SB<1A1B><:2IC<1B>X3fooF$$Int64
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
