// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-tokens 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-parse 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-ast 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-symbols 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-ir 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --dump-bc 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-1: %frontendCompiler --typecheck 2>&1 | compare %f
// ASSERT: regex error.*expected at least one source code file when compiling source code
