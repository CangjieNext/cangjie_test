// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile inc.cj -o %output
// EXEC-1: %run %run_opt %output
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile inc.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output
// ASSERT: scan the changed decl after Spreading is:foo in file inc.cj in line 5 in column 6


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
