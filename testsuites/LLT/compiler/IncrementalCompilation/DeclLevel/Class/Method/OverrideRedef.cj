// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:foo in file OverrideRedef.old.cj in line 20 in column 10
// ASSERT: scan the changed decl after Spreading is:bar in file OverrideRedef.old.cj in line 22 in column 10
// ASSERT: scan the changed decl after Spreading is:too in file OverrideRedef.old.cj in line 25 in column 10
// ASSERT: scan the changed decl after Spreading is:er in file OverrideRedef.old.cj in line 27 in column 10
// ASSERT: scan the changed decl after Spreading is:moon in file OverrideRedef.old.cj in line 30 in column 10
// ASSERT: scan the changed decl after Spreading is:fat in file OverrideRedef.old.cj in line 32 in column 10
// ASSERT: scan the changed decl after Spreading is:mat in file OverrideRedef.old.cj in line 35 in column 10
// ASSERT: scan error: 'override' function 'er' does not have an overridden function in its supertype
// ASSERT: scan error: 'redef' function 'fat' does not have a redefined 'static' function in its supertype

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
