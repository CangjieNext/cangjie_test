// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %cpfile %n.old.cj lib.cj
// EXEC: %cpfile %f main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output

// EXEC: %cpfile %n.new.cj lib.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension > %redirectNull
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC-2: %run %run_opt %output %run_args

internal import inc.*

main(): Int64 {
    let a = A()
    let b = B()
    a.foo() - b.some
}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan 1A<:2I1X lib.cj 29: body 
// ASSERT: scan     deleted members 2: 3inc7Extend!1A<:2I1X4someP 3inc4someP1A<:2I1X3getF$$Int64 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file lib.cj in line 3 in column 19
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 17 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file lib.cj in line 24 in column 14
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 26 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 29 in column 1
// ASSERT: scan deleted decls: 2
// ASSERT: scan the deleted decl is:3inc7Extend!1A<:2I1X4someP
// ASSERT: scan the deleted decl is:3inc4someP1A<:2I1X3getF$$Int64
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
