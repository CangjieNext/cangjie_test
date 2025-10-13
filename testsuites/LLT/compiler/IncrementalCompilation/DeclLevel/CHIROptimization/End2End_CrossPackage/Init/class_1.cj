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
    if (C().a == 0 && C().b == 0 && C.c == 0) {
        return 0
    } else if (C().a == 1 && C().b == 1 && C.c == 1){
        return 1
    } else {
        return 2
    }
}
// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan C 3inc1CC lib.cj 3: memory 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:C in file lib.cj in line 3 in column 14
// ASSERT: scan the changed decl after Spreading is:a in file lib.cj in line 4 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file lib.cj in line 5 in column 16
// ASSERT: scan the changed decl after Spreading is:c in file lib.cj in line 6 in column 25
// ASSERT: scan the changed decl after Spreading is:main in file class_1.cj in line 15 in column 1
// ASSERT: scan incremental sema



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
