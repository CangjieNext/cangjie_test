// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 %dumpCHIRDebug | compare %f

// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file DupExtend02.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DupExtend02.old.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:nut in file DupExtend02.old.cj in line 5 in column 10
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DupExtend02.old.cj in line 12 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file DupExtend02.old.cj in line 13 in column 10

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
