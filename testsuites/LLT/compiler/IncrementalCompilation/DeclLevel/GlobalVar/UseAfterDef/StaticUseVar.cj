// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output -Woff unused 2>&1 | compare %n.diag.txt
// EXEC: cat .cached/*.log | compare %f

// ASSERT: scan 2 order changed decl(s).
// ASSERT: scan order change 7default1AC3fooF$$
// ASSERT: scan order change 7default1AC1cV$$

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
