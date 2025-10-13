// DEPENDENCE: pkg.old.cj pkg.new.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused --int-overflow=wrapping %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension --int-overflow=wrapping %cmp_opt -o %output
// EXEC: %cpfile pkg.new.cj pkg.old.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -Woff unused --int-overflow=wrapping %compile_lib_opt -o libpkg1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension --int-overflow=wrapping %cmp_opt -o %output 2>&1 | compare %f

internal import inc.* 

main(): Int64 {  
    f < UInt8 >() 
    return 0 
} 

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:f0 in file pkg.old.cj in line 5 in column 10
// ASSERT: scan the changed decl after Spreading is:f in file pkg.old.cj in line 26 in column 13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
