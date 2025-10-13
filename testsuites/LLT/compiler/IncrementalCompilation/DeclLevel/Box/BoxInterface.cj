// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-PIPE: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 13
// ASSERT: scan the changed decl after Spreading is:I1 in file BoxInterface.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:foo in file BoxInterface.old.cj in line 2 in column 6
// ASSERT: scan the changed decl after Spreading is:I2 in file BoxInterface.old.cj in line 4 in column 11
// ASSERT: scan the changed decl after Spreading is:gar in file BoxInterface.old.cj in line 5 in column 10
// ASSERT: scan the changed decl after Spreading is:I3 in file BoxInterface.old.cj in line 8 in column 11
// ASSERT: scan the changed decl after Spreading is:A in file BoxInterface.old.cj in line 13 in column 7
// ASSERT: scan the changed decl after Spreading is:E1 in file BoxInterface.old.cj in line 16 in column 6
// ASSERT: scan the changed decl after Spreading is:B in file BoxInterface.old.cj in line 19 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file BoxInterface.old.cj in line 22 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file BoxInterface.old.cj in line 23 in column 5
// ASSERT: scan the changed decl after Spreading is:c in file BoxInterface.old.cj in line 24 in column 5
// ASSERT: scan the changed decl after Spreading is:d in file BoxInterface.old.cj in line 25 in column 5
// ASSERT: scan the changed decl after Spreading is:e in file BoxInterface.old.cj in line 26 in column 5

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
