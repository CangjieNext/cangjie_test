// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

internal import p1.*

main() {
    A().jar()-A().bar()
}

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A in file PopulateOtherExtend.old.cj in line 6 in column 15
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file PopulateOtherExtend.old.cj in line 12 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file PopulateOtherExtend.cj in line 16 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file PopulateOtherExtend.old.cj in line 18 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
