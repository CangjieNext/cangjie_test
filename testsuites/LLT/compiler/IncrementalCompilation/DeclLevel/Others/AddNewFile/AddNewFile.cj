// DEPENDENCE: p1 p2
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %move p1 p1_bak
// EXEC: %move p2 p1
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p p1 -o %output 2>&1 | compare %f
// ASSERT: scan-not rollback
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not no change
// EXEC: %run %run_opt %output %run_args
// EXEC: %move p1 p2
// EXEC: %move p1_bak p1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
