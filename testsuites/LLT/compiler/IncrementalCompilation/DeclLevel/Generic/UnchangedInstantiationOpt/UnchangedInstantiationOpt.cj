// DEPENDENCE: pkg1.cj pkg2.cj %n.old.cj %n.new.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj pkg2.%middle pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt inc.cj pkg2.%middle pkg1.%middle -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 1
// RUN-EXEC: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
