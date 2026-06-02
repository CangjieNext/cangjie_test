// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC-PIPE-1: %compiler --output-type=exe main.cj -o main.cj 2>&1 | compare %f
// ASSERT: scan [31merror[0m: The input file 'main.cj' would be overwritten by the generated output.
