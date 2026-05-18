/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception in thread "main" default.A|An exception has occurred

class A <: Exception {}

var test = {
    =>
    var foo = {=> throw A()};
    foo();
    1
}()

main() {
    try {
        test
    } catch (a: A) { // throw before try.
        return 5
    }
    return 5
}
