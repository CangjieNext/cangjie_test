// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --output behaves correctly (1.4.1)
 */

// DEPENDENCE: ../src/package00
// EXEC: %compiler -p package00 --output %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello cangjie!
