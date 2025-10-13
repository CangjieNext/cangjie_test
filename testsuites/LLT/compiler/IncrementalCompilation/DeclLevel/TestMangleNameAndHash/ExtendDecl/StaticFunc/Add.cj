// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added members 1: 7default7Extend!l<:X3set<1T>Fl!1a=$$l 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
+		changed decls to recompile: 6
+		the changed decl after Spreading is:ExtendDecl in file main.cj in line 1 in column 1
+		the changed decl after Spreading is:ExtendDecl in file to_string.cj in line 18 in column 1
+		the changed decl after Spreading is:set in file main.cj in line 22 in column 10
+		the changed decl after Spreading is:ExtendDecl in file countable.cj in line 28 in column 1
+		the changed decl after Spreading is:ExtendDecl in file hashable.cj in line 53 in column 1
+		the changed decl after Spreading is:ExtendDecl in file comparable.cj in line 102 in column 1
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
