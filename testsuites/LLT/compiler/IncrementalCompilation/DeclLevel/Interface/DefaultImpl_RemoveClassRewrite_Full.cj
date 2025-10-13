// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan B 7default1BC DefaultImpl_RemoveClassRewrite_Full.old.cj 4: body
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:B in file DefaultImpl_RemoveClassRewrite_Full.old.cj in line 4 in column 7
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default1BC3fooF$$l
// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
