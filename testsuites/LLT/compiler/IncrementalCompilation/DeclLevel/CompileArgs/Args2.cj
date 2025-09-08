main(): Int64 { 0 }
// LEVEL: 0
// DEPENDENCE: NoChange.expect NoChange.expect
// EXEC: %compiler %incrementalCompile %f -o %output
// ASSERT: scan incremental compile result kind: rollback

// EXEC-PIPE-1: %compiler %f %incrementalCompile -o %output --sanitizer-coverage-inline-8bit-counters 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --sanitizer-coverage-level=0 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --disable-chir-opt 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --fast-math 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --int-overflow=wrapping 2>&1 | compare %f
// (not Windows) EXEC-PIPE-1: %compiler %f %incrementalCompile -o %output --sysroot ~ 2>&1 | compare %f
// (not Windows) EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --int-overflow=wrapping 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --int-overflow=wrapping 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --output-type=dylib 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare %f
// deprecated '--module-name'
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output --module-name abc 2>&1 | compare NoChange.expect

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare NoChange.expect
// EXEC-PIPE-0: %compiler %f %incrementalCompile --experimental -o %output 2>&1 | compare NoChange.expect
// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output 2>&1 | compare NoChange.expect

// EXEC-PIPE-0: %compiler %f %incrementalCompile -o %output -g --cfg "today=111" 2>&1 | compare %f


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
