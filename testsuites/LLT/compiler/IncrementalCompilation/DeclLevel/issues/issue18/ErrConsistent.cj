// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt inc.cj -o %output 2>&1 | compare %n.new.cj
// ASSERT: scan incremental compilation triggered
// EXEC-PIPE-1: %compiler %cmp_opt inc.cj -o %output 2>&1 | compare %n.new.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
