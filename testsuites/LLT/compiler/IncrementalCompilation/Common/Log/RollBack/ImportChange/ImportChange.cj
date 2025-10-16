// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %rmdir .cached
// EXEC: %cpfile %n.old.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo --experimental --incremental-compile main.cj -o %output -j1
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo --experimental --incremental-compile main.cj -o %output -j1
// (Linux)EXEC: cat .cached/*.log | compare %n.cj
// (Windows)EXEC: type .cached\*.log | compare %n.cj
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan package or import specs changed, roll back to full compilation


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
