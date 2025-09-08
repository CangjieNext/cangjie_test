// EXEC: %compiler %incrementalCompile %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %f %incrementalCompile -g -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// ASSERT: scan incremental compile result kind: rollback
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
