// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining 2>&1 | compare %f

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:B in file issue52.old.cj in line 3 in column 7
// ASSERT: scan the changed decl after Spreading is:b in file issue52.old.cj in line 4 in column 16
// ASSERT: scan the changed decl after Spreading is:B in file issue52.old.cj in line 5 in column 12
// ASSERT: scan the changed decl after Spreading is:C in file issue52.old.cj in line 11 in column 12

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
