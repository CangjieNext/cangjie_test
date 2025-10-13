// DEPENDENCE: ../%n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC-5: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not incremental compile result kind
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:B in file test.inc.cj in line 34 in column 7
// ASSERT: scan the changed decl after Spreading is:ss in file test.inc.cj in line 38 in column 24
// ASSERT: scan the changed decl after Spreading is:test in file test.inc.cj in line 43 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test.inc.cj in line 48 in column 1
// EXEC-3: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
