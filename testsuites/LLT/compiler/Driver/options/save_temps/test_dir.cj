// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: mkdir temps
// EXEC: %compiler main.cj --output-type=exe %save_temps_opt=temps
// EXEC: %ls temps | compare %f
// ASSERT: scan main.bc
//  ASSERT: scan main.opt.bc
// ASSERT: scan main.o
//  ASSERT: scan main.s
