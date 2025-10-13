// DEPENDENCE: com.old.cj %n.new.cj
// EXEC: %cpfile com.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:a in file changeinit_wrongty.inc.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file changeinit_wrongty.inc.cj in line 7 in column 5
// ASSERT: scan the changed decl after Spreading is:c in file changeinit_wrongty.inc.cj in line 8 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file changeinit_wrongty.inc.cj in line 14 in column 6
// ASSERT: scan mismatched types
// ASSERT: scan 3 errors generated, 3 errors printed.


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
