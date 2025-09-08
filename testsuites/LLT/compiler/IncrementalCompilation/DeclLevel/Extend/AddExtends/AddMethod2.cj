// DEPENDENCE: common.cj %n.new.cj
// EXEC: %compiler %incrementalCompile common.cj -o %output
// EXEC: %cpfile %n.new.cj common.cj
// EXEC-PIPE: %compiler %incrementalCompile common.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:A in file common.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file common.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file common.cj in line 7 in column 1
// ASSERT: scan the changed decl after Spreading is:bar in file common.cj in line 8 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file common.cj in line 11 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file common.cj in line 16 in column 1
// ASSERT: scan the changed decl after Spreading is:ram in file common.cj in line 17 in column 24


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
