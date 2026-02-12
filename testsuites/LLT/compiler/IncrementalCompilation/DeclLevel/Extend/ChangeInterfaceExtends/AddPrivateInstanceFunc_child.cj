// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.old.cj -o %output %cmp_opt 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:main in file AddPrivateInstanceFunc_child.old.cj in line 7 in column 1
// ASSERT: scan the changed decl after Spreading is:some in file AddPrivateInstanceFunc_child.old.cj in line 20 in column 20

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
