// DEPENDENCE: common2.cj %n.new.cj
// EXEC: %compiler %incrementalCompile common2.cj -o %output
// EXEC: %cpfile %n.new.cj common2.cj
// EXEC-PIPE: %compiler %incrementalCompile common2.cj -o %output 2>&1 | compare %f
// RUN-EXEC-6: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:foo in file common2.cj in line 9 in column 17


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
