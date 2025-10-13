// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir p1
// EXEC: %cpfile %n.old.cj p1
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension  %f -o %output
// EXEC: %rmfile p1/%n.old.cj
// EXEC: %cpfile %n.new.cj p1/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

import p1.*

main() {
    unsafe {
    let a = LibC.mallocCString("CJ")
    let b = a.foo(1)
    LibC.free(a)
    b
    }
}

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportExtendCString.old.cj in line 9 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportExtendCString.old.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file ImportExtendCString.cj in line 14 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file c_string_resource.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
