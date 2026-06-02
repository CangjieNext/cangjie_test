// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC:%compiler main.cj -o%output
// EXEC:%run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello cangjie!
