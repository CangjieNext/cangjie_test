// DEPENDENCE: common2.cj %n.new.cj
// EXEC: %compiler %incrementalCompile common2.cj -o %output
// EXEC: %cpfile %n.new.cj common2.cj
// EXEC-PIPE: %compiler %incrementalCompile common2.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file common2.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file common2.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:jam in file common2.cj in line 15 in column 24
// ASSERT: scan the changed decl after Spreading is:tee in file common2.cj in line 15 in column 55
// ASSERT: scan the changed decl after Spreading is:boxuse in file common2.cj in line 23 in column 6


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
