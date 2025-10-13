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

main() {
    let a: A = A()
    a.k
}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan 1A<:2I1X lib.cj 5: body 
// ASSERT: scan     added members 1: 3inc1kP1A<:2I1X3setF$$Unit 
// ASSERT: scan     changed members 1:
// ASSERT: scan          3inc7Extend!1A<:2I1X1kP: srcuse 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:A in file lib.cj in line 3 in column 19
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file lib.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:k in file lib.cj in line 6 in column 21
// ASSERT: scan the changed decl after Spreading is:$kget in file lib.cj in line 7 in column 9
// ASSERT: scan the changed decl after Spreading is:$kset in file lib.cj in line 10 in column 9
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 17 in column 1
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
