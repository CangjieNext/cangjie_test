// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj lib.cj

// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %f A.%lib_extension -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj lib.cj
// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension > %redirectNull
// EXEC-PIPE-0: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %f A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

internal import inc.*

main() {
    return A<Int64>().f<Int32>()
}
// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan A 3inc1A<1>S lib.cj 3: 
// ASSERT: scan     changed members 1:
// ASSERT: scan          3inc1A<1>S1f<1U>F$$Int64: body 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:init in file lib.cj in line 0 in column 0
// ASSERT: scan the changed decl after Spreading is:A in file lib.cj in line 3 in column 15
// ASSERT: scan the changed decl after Spreading is:f in file lib.cj in line 5 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file struct_3.cj in line 15 in column 1
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
