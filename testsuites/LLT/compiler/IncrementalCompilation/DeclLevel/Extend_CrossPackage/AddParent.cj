// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %cpfile %n.old.cj lib.cj
// EXEC: %cpfile %f main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output
// RUN-EXEC-5: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj lib.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension > %redirectNull
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC-5: %run %run_opt %output %run_args

internal import inc.*

main() {
    A1().foo() + E1.R.foo()
}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added 2E1<:2I1&2I2X at 18,1
// ASSERT: scan added 2A1<:X at 26,1
// ASSERT: scan deleted 2A1<:2I1X
// ASSERT: scan deleted 2E1<:X
// ASSERT: scan deleted 3inc7Extend!2A1<:2I1X3fooF$$Int64
// ASSERT: scan deleted 3inc7Extend!2E1<:X3fooF$$Int64
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:E1 in file lib.cj in line 14 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 18 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 18 in column 1
// ASSERT: scan the changed decl after Spreading is:A1 in file lib.cj in line 24 in column 14
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 26 in column 1
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:2A1<:2I1X
// ASSERT: scan the deleted decl is:3inc7Extend!2A1<:2I1X3fooF$$Int64
// ASSERT: scan the deleted decl is:2E1<:X
// ASSERT: scan the deleted decl is:3inc7Extend!2E1<:X3fooF$$Int64
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
