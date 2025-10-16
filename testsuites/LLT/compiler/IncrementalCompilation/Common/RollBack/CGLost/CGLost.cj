// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %rmdir .cached
// EXEC: %cpfile %n.old.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output -j1
// RUN-EXEC: %run %run_opt %output %run_args

// (not Windows) EXEC: %rmfile .cached/*.cgCache
// (Windows) EXEC: %rmfile .cached\*.cgCache
// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output -j1 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan load cached codegen info failed, roll back to full compilation



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
