// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: %compiler --output-type=exe main.cj %save_temps_opt=.
// EXEC: %ls | compare %f
// ASSERT: scan main.bc
//  ASSERT: scan main.opt.bc
// ASSERT: scan main.o
//  ASSERT: scan main.s
