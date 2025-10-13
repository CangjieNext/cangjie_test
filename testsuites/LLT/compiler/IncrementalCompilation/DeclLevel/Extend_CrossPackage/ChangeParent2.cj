// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %cpfile %n.old.cj lib.cj
// EXEC: %cpfile %f main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj lib.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension > %redirectNull
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %n.new.cj

internal import inc.*

main() {
    let a = A1()
    a.foo()
    let a2 = A2()
    a2.foo()
}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added 2A1<:2I2X at 16,1
// ASSERT: scan added 2A2<:2I1X at 22,1
// ASSERT: scan deleted 2A1<:2I1X
// ASSERT: scan deleted 2A2<:2I2X
// ASSERT: scan deleted 3inc7Extend!2A1<:2I1X3fooF$$Unit

// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A1 in file lib.cj in line 14 in column 15
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 16 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 18 in column 1
// ASSERT: scan the changed decl after Spreading is:A2 in file lib.cj in line 21 in column 15
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 22 in column 1
// ASSERT: scan deleted decls: 3
// ASSERT: scan the deleted decl is:2A1<:2I1X
// ASSERT: scan the deleted decl is:3inc7Extend!2A1<:2I1X3fooF$$Unit
// ASSERT: scan the deleted decl is:2A2<:2I2X

// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
