// DEPENDENCE: old.cj new.cj
// EXEC: %compiler %incrementalCompile -O2 %cmp_opt  -O0 --coverage --fast-math --fno-chir-function-inlining --fchir-devirtualization --fchir-function-inlining --fno-chir-constant-propagation --fno-chir-devirtualization old.cj -o %output
// EXEC: %cpfile new.cj old.cj
// EXEC: %compiler %incrementalCompile -O2 %cmp_opt  -O0 --coverage --fast-math --fno-chir-function-inlining --fchir-devirtualization --fchir-function-inlining --fno-chir-constant-propagation --fno-chir-devirtualization old.cj -o %output
// EXEC: %output 2>&1 | compare %f

// ASSERT: scan cannot have assignment expression in initializer
// ASSERT: scan var(a, b):(Int32, Rune) = a = b
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing decl error.
// ASSERT: regex-not profiling: .*/default.gcda: cannot merge previous GCDA file


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
