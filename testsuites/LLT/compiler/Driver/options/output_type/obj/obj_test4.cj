// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: foo.cj
// EXEC-PIPE-1: %compiler foo.cj --output-type=obj -o main.o --experimental 2>&1 | compare %f
// ASSERT: scan 'main' is missing
