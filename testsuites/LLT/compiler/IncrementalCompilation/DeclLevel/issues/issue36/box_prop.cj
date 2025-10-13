// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -O2 --fast-math  --fchir-constant-propagation --fchir-devirtualization --fno-chir-constant-propagation --fno-chir-function-inlining --fno-chir-devirtualization inc.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -O2 --fast-math  --fchir-constant-propagation --fchir-devirtualization --fno-chir-constant-propagation --fno-chir-function-inlining --fno-chir-devirtualization inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC: %compiler %cmp_opt inc.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
