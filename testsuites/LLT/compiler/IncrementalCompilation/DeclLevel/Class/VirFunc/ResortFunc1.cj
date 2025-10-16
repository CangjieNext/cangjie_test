// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %noStackInfo %n.old.cj -o %output
// EXEC-10: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %noStackInfo %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC-10: %run %run_opt %output %run_args

// ASSERT: scan the changed decl after Spreading is:useBFoo
// ASSERT: scan the changed decl after Spreading is:useDFoo
// ASSERT: scan the changed decl after Spreading is:main
// ASSERT: scan the changed decl after Spreading is:Derive
// ASSERT: scan the changed decl after Spreading is:Base
// ASSERT: scan the changed decl after Spreading is:fuzz in file ResortFunc1.old.cj in line 2 in column 22
// ASSERT: scan the changed decl after Spreading is:foo in file ResortFunc1.old.cj in line 5 in column 22

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
