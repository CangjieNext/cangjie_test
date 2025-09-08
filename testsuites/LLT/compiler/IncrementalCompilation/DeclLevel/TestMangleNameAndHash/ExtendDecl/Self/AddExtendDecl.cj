// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file main.cj in line 1 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file main.cj in line 9 in column 1
// ASSERT: scan the changed decl after Spreading is:I1 in file main.cj in line 17 in column 18
// ASSERT: scan the changed decl after Spreading is:I2 in file main.cj in line 21 in column 18


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
