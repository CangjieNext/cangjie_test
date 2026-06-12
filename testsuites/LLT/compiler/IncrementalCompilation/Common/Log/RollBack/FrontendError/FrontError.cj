// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output

// (Linux)EXEC: cat .cached/*.log | compare %n.cj
// (Windows)EXEC: type .cached\*.log | compare %n.cj

// ASSERT: scan frontend error detected, roll back to full compilation

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
