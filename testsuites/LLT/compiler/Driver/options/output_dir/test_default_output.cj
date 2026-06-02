// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: mkdir outdir
// EXEC: %compiler main.cj %output_dir_opt outdir
// (Linux) EXEC: %run ./outdir/%main | compare %f
// (Windows) EXEC: %run .\outdir\%main | compare %f
// ASSERT: scan Hello cangjie!
