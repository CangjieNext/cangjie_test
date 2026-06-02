// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// (not Windows) EXEC: mkdir -p c/a
// (Windows) EXEC: mkdir c\a
// EXEC: %compiler main.cj %output_dir_opt c -o a/%output
// (not Windows) EXEC: %run %run_opt ./c/a/%output %run_args | compare %f
// (Windows) EXEC: %run %run_opt .\c\a\%output %run_args | compare %f
// ASSERT: scan Hello cangjie!
