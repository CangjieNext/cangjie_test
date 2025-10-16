// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %noStackInfo %n.old.cj -o %output
// EXEC-11: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %noStackInfo %n.old.cj -o %output 2>&1 | compare %f
// EXEC-11: %run %run_opt %output %run_args

// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:Base
// ASSERT: scan the changed decl after Spreading is:Derive
// ASSERT: scan the changed decl after Spreading is:foo in file ChangeSig2.old.cj in line 2
// ASSERT: scan the changed decl after Spreading is:useBFoo in file ChangeSig2.old.cj in line 13
// ASSERT: scan the changed decl after Spreading is:useDFoo in file ChangeSig2.old.cj in line 18

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
