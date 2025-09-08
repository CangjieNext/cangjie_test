// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:x in file Deprecated_Callsite.old.cj in line 1 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file Deprecated_Callsite.old.cj in line 3 in column 6
// ASSERT: scan the changed decl after Spreading is:goo in file Deprecated_Callsite.old.cj in line 8 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file Deprecated_Callsite.old.cj in line 10 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
