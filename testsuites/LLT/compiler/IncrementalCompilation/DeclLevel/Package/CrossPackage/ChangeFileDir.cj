// DEPENDENCE: %n.old1.cj %n.new1.cj %n.old2.cj %n.new2.cj
// EXEC: %mkdir p1
// EXEC: %cpfile %n.old2.cj a.cj
// (Windows) EXEC: %cpfile %n.old1.cj p1\b.cj
// (not Windows) EXEC: %cpfile %n.old1.cj p1/b.cj
// (Windows) EXEC: %compiler a.cj p1\b.cj %incrementalCompile -o %output
// (not Windows) EXEC: %compiler a.cj p1/b.cj %incrementalCompile -o %output
// EXEC: %cpfile %n.new2.cj a.cj
// (Windows) EXEC: %cpfile %n.new1.cj p1\b.cj
// (not Windows) EXEC: %cpfile %n.new1.cj p1/b.cj
// (Windows) EXEC: %compiler a.cj p1\b.cj %incrementalCompile -o %output 2>&1
// (not Windows) EXEC: %compiler a.cj p1/b.cj %incrementalCompile -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:foo in file a.cj in line 1 in column 13

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
