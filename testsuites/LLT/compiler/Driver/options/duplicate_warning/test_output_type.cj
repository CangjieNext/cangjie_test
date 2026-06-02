// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC:%compiler %compile_lib_opt --output-type=exe main.cj -o %output 2>&1 | compare %f
//(not CJNATIVE) EXEC:%compiler %compile_lib_opt --output-type=cbc main.cj -o %output 2>&1 | compare %f
// ASSERT: regex is specified multiple times
// EXEC: %run %run_opt %output %run_args
