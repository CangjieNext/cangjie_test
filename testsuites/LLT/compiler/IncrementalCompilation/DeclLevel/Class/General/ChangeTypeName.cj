// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan added B1 7default2B1S at 2,15
// ASSERT: scan added B2 7default2B2C at 3,7
// ASSERT: scan added B3 7default2B3U at 4,6
// ASSERT: scan added B4 7default2B4I at 5,11
// ASSERT: scan added 2B3<:2B4X at 6,1
// ASSERT: scan added 2B3<:X at 7,1
// ASSERT: scan added B5 7default2B5T at 8,6
// ASSERT: scan deleted 2A3<:2A4X
// ASSERT: scan deleted 2A3<:X
// ASSERT: scan deleted 7default2A1S
// ASSERT: scan deleted 7default2A2C
// ASSERT: scan deleted 7default2A3U
// ASSERT: scan deleted 7default2A4I
// ASSERT: scan deleted 7default2A5T
// ASSERT: scan rollback
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
