// DEPENDENCE: ../%n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan added ga 7default2gaU at 24,6
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:EE in file test.inc.cj in line 25 in column 5
// ASSERT: scan the changed decl after Spreading is:ga in file test.inc.cj in line 24 in column 6
// ASSERT: regex redefinition of declaration 'ga'


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
