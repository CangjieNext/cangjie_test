// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --output behaves correctly (1.4.1)
 */

// DEPENDENCE: ../src/main.cj
// EXEC: mkdir outputdir
// EXEC: %compiler main.cj --output outputdir
// (Linux) EXEC: %run outputdir/%main | compare %f
// (Windows) EXEC: %run outputdir\%main | compare %f
// ASSERT: scan Hello cangjie!
