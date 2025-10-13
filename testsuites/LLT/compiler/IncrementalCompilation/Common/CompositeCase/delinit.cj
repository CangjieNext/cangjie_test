// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -Woff unused -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args | compare %n.new.cj
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:init in file delinit.inc.cj in line 21 in column 5


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
