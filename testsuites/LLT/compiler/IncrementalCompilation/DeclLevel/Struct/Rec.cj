// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC-1: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension | compare %n.new.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

internal import p1.*
main() {
    u1()
}

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:B in file Rec.old.cj in line 7 in column 15
// ASSERT: scan the changed decl after Spreading is:init in file Rec.old.cj in line 8 in column 12
// ASSERT: scan the changed decl after Spreading is:b in file Rec.old.cj in line 8 in column 18


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
