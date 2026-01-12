// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: main.cj
// EXEC: %compiler main.cj --output-type=obj -o main.o --experimental
// EXEC: %compiler main.o -lcangjie-std-core --experimental -o %output
// EXEC: %output %run_args | compare %f
// ASSERT: scan Hello cangjie!