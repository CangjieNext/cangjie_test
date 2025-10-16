// DEPENDENCE: %n.old.cj %n.new.cj %n.p1.old.cj %n.p1.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.p1.old.cj %n/%n.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -O2 -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt -O2 %n.%lib_extension %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.p1.new.cj %n/%n.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -O2 -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt -O2 %n.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan the changed decl after Spreading is:main in file CCWrap.old.cj in line 3 in column 1
// ASSERT: scan deleted decls: 2
// ASSERT: scan the deleted decl is:2p13fooF$$Int64
// ASSERT: scan the deleted decl is:2p13barF$$() -> Int64

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
