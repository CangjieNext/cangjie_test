// DEPENDENCE: %n.old.cj %n.new.cj %n.p.cj %n.p2.cj
// EXEC: %mkdir c1
// EXEC: %cpfile %n.p.cj c1
// EXEC: %compiler %cmp_opt -p c1 %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt A.%lib_extension %n.old.cj -o %output
// EXEC: %cpfile %n.p2.cj c1/%n.p.cj
// EXEC: %compiler %cmp_opt -p c1 %compile_lib_opt -o A.%lib_extension %incrementalCompile 2>&1
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %run %run_opt %output %run_args
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt A.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 22
// ASSERT: scan-not core dumped

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
