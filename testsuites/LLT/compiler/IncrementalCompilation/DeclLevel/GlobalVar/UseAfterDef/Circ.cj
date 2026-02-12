// DEPENDENCE: %n.1.cj %n.1new.cj %n.2.cj %n.2new.cj %n.diag.txt
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.1.cj %n.2.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.1new.cj %n.1.cj
// EXEC: %cpfile %n.2new.cj %n.2.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.1.cj %n.2.cj -o %output -Woff unused 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f

// ASSERT: scan 4 order changed decl(s).
// ASSERT: scan order change 7default1bV$$l
// ASSERT: scan order change 7default1dV$$l
// ASSERT: scan order change 7default1cV$$l
// ASSERT: scan order change 7default1aV$$l

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
