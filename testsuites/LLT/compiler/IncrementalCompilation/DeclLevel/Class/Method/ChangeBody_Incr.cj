// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 14
// ASSERT: scan the changed decl after Spreading is:A in file ChangeBody_Incr.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file ChangeBody_Incr.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:init in file ChangeBody_Incr.old.cj in line 3 in column 12
// ASSERT: scan the changed decl after Spreading is:init in file ChangeBody_Incr.old.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:A in file ChangeBody_Incr.old.cj in line 10 in column 5
// ASSERT: scan the changed decl after Spreading is:~init in file ChangeBody_Incr.old.cj in line 14 in column 5
// ASSERT: scan the changed decl after Spreading is:get in file ChangeBody_Incr.old.cj in line 19 in column 9
// ASSERT: scan the changed decl after Spreading is:set in file ChangeBody_Incr.old.cj in line 22 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file ChangeBody_Incr.old.cj in line 28 in column 6
// ASSERT: scan the changed decl after Spreading is:R in file ChangeBody_Incr.old.cj in line 29 in column 5
// ASSERT: scan the changed decl after Spreading is:K in file ChangeBody_Incr.old.cj in line 29 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file ChangeBody_Incr.old.cj in line 31 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file ChangeBody_Incr.old.cj in line 35 in column 9
// ASSERT: scan the changed decl after Spreading is:main in file ChangeBody_Incr.old.cj in line 40 in column 1

// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
