// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The 20000-deep `return return ...` chain used to overflow the parser stack and
// die with SIGSEGV (UsersForum issue 3128). The parser now bounds its nesting
// depth and reports a regular diagnostic instead of an internal compiler error.

// DEPENDENCE: generate_multi_return.py
// (Linux) EXEC: %python generate_multi_return.py
// (Linux) EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// (Linux) ASSERT: scan-not core dumped
// (Linux) ASSERT: scan-not Internal Compiler Error
// (Linux) ASSERT: scan exceeded maximum nesting depth while parsing
// (Linux) ASSERT: scan unclosed delimiter
