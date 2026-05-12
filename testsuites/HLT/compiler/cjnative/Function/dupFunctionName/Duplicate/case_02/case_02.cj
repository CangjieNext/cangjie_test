/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test.cj
// EXEC: %compiler %cmp_opt test.cj %compile_lib_opt
// EXEC: %compiler %cmp_opt %f -o %output -L. -ltest
// RUN-EXEC: %run %run_opt %output %run_args

package aaa
import test.*
main()
{
    return 0
}