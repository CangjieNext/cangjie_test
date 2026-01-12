// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: main.cj
// EXEC: %compiler main.cj --output-type=obj -o main.o --experimental
// EXEC-PIPE-1: %compiler main.o --output-type=obj --experimental -o %output  2>&1 | compare %f
// EXEC: %compiler main.o --output-type=staticlib --experimental
// ASSERT: scan expected at least one source code file when compiling source code
