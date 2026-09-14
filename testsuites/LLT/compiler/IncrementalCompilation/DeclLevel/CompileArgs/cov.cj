// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj --coverage -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj --coverage -o %output && cat .cached/*.log | compare %n.new.cj
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 && cat .cached/*.log | compare %f

// ASSERT: scan ParseASTException: Failed to parse expr.
// ASSERT: regex-not profiling .* cannot merge pervious GCDA file
