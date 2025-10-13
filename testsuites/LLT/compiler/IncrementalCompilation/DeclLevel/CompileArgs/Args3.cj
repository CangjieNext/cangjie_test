main(): Int64 { 0 }
// DEPENDENCE: NoChange.expect
// EXEC: %compiler %incrementalCompile %f -o %output
// ASSERT: scan incremental compile result kind: rollback
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --backend=llvm 2>&1 | compare NoChange.expect

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --dy-libs 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O1 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O1 --fchir-constant-propagation --fno-function-sections --fno-data-sections 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O1 --fno-chir-constant-propagation --fno-function-sections --fno-data-sections 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O1 --fno-chir-constant-propagation --fchir-function-inlining --fno-function-sections  2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O1 --fno-chir-constant-propagation --fchir-function-inlining --fchir-devirtualization  2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --fno-chir-redundant-return-removal 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --fno-chir-sroa 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --fchir-redundant-assign-removal 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --fno-chir-loop-invariant-code-motion 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O2 --fno-chir-sroa 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 --fchir-letc-folding 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 --fchir-ref-folding 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 --fchir-array-lambda 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O3 --fchir-switch-opt 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O3 2>&1 | compare NoChange.expect
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -Os 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -Oz 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -O0 2>&1 | compare %f
// (not Windows) EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --lto full --fdata-sections 2>&1 | compare %f
// (not Windows) EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --lto thin --fdata-sections 2>&1 | compare %f

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
