// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: mkdir outdir
// (Linux) EXEC: %compiler main.cj %output_dir_opt outdir %output_opt /%output 2>&1 | compare %f
// (Windows) EXEC: %compiler main.cj %output_dir_opt outdir %output_opt C:/%output 2>&1 | compare %f
// ASSERT: scan does not accept absolute path
