/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src 
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle 2>&1 | compare %f



import pkgs.*

public type Type3 = List<Type1>*Type2

main(): Int64 {
  return 0
}
// ASSERT: scan sema_typealias_cycle
