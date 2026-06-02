main(): Int64 { 0 }
// DEPENDENCE: NoChange.expect
// EXEC: %compiler %incrementalCompile %f -o %output
// ASSERT: scan compile args changed, roll back to full compilation

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare NoChange.expect
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --cfg="cond=abc" 2>&1 && cat .cached/*.log | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -g 2>&1 && cat .cached/*.log | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --trimpath abc 2>&1 && cat .cached/*.log | compare %f

// (NOSTACKINFO)EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f
// (NOSTACKINFO)EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 %noStackInfo && cat .cached/*.log | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 2>&1 && cat .cached/*.log | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 && cat .cached/*.log | compare %f

// (NOSTACKINFO)EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output %noStackInfo 2>&1 && cat .cached/*.log | compare %f
// (NOSTACKINFO)EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output %cmp_utest_opt 2>&1 && cat .cached/*.log | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 && cat .cached/*.log | compare %f

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
