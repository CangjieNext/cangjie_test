// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj
// (DEBUG_OPTION) EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// (DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION) EXEC: %rmfile %n.old.cj
// (DEBUG_OPTION) EXEC: %move %n.new.cj %n.old.cj
// (DEBUG_OPTION) EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION) ASSERT: scan incremental compilation triggered
// (DEBUG_OPTION) ASSERT: scan the changed decl after Spreading is:main in file test_future_get.old.cj in line 7 in column 1
// (DEBUG_OPTION) EXEC-PIPE-0: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
