// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.test.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.test.cj -o %output
// EXEC: %cpfile %n.new.cj %n.test.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.test.cj -o %output | compare %f
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:C1 in file prop.test.cj in line 28 in column 23
// ASSERT: scan the changed decl after Spreading is:c1_p3 in file prop.test.cj in line 33 in column 17
// ASSERT: scan the changed decl after Spreading is:c1_f3 in file prop.test.cj in line 39 in column 17
// ASSERT: scan the changed decl after Spreading is:C0 in file prop.test.cj in line 51 in column 23
// ASSERT: scan the changed decl after Spreading is:main in file prop.test.cj in line 64 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
