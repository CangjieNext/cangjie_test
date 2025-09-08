// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output %noStackInfo
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output %noStackInfo 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:A in file PropagateAllExtends.old.cj in line 1 in column 8
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file PropagateAllExtends.old.cj in line 6 in column 1
// ASSERT: scan the changed decl after Spreading is:get in file PropagateAllExtends.old.cj in line 12 in column 9
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file PropagateAllExtends.old.cj in line 17 in column 1
// ASSERT: scan the changed decl after Spreading is:joom in file PropagateAllExtends.old.cj in line 17 in column 30
// ASSERT: scan the changed decl after Spreading is:main in file PropagateAllExtends.old.cj in line 18 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
