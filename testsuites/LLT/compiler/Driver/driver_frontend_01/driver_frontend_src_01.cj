// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//DEPENDENCE: ./list.txt
// ERRORCHECK: %frontendCompiler ./list.txt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex the arg './list.txt' may be unused
// ASSERT: regex expected at least one source code file when compiling source code
