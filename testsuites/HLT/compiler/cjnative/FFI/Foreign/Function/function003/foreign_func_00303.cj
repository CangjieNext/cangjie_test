/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

foreign func a(): Unit

foreign func b(): Unit

var x = a(1)
var y = b(1)
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_wrong_number_of_arguments
