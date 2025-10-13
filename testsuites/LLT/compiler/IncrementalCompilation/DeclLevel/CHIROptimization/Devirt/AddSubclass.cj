// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %optimization_level_2 %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:lm in file AddSubclass.old.cj in line 7 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file AddSubclass.old.cj in line 11 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file AddSubclass.old.cj in line 15 in column 12
// ASSERT: scan the changed decl after Spreading is:foo in file AddSubclass.old.cj in line 16 in column 31


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
