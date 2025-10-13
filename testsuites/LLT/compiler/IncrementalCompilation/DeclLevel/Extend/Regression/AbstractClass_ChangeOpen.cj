// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

internal import p1.*

public class Next <: Kami {
    
}

main() {
    let a = Next()
    a.foo()
}

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:Kami in file AbstractClass_ChangeOpen.old.cj in line 3 in column 23
// ASSERT: scan the changed decl after Spreading is:foo in file AbstractClass_ChangeOpen.old.cj in line 4 in column 22
// ASSERT: scan the changed decl after Spreading is:Next in file AbstractClass_ChangeOpen.cj in line 13 in column 14
// ASSERT: scan the changed decl after Spreading is:main in file AbstractClass_ChangeOpen.cj in line 17 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
