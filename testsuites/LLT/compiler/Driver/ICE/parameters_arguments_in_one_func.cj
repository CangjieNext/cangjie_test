// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: generate_parameters_arguments_in_one_func.py
// (Linux) EXEC: %python generate_parameters_arguments_in_one_func.py
// (Linux) EXEC-PIPE-139: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// (Linux) ASSERT: scan-not core dumped
// (CJNATIVE and Linux) ASSERT: scan [31mInternal Compiler Error: [0mInterrupt signal (11) received.\nPlease report this to Cangjie team and include the project. Error Code: 6
// (CJNATIVE and Windows) ASSERT: scan [31mInternal Compiler Error: [0mWindows unexpected exception code (3221225725) received.\nPlease report this to Cangjie team and include the project. Error Code: 6
// (not CJNATIVE and Linux) ASSERT: scan [31mInternal Compiler Error: [0mInterrupt signal (11) received.\nPlease report this to Cangjie team and include the project. Error Code: 5
// (not CJNATIVE and Windows) ASSERT: scan [31mInternal Compiler Error: [0mWindows unexpected exception code (3221225725) received.\nPlease report this to Cangjie team and include the project. Error Code: 5

