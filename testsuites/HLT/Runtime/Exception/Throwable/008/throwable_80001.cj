/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: use_80001.cj
// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o define.%middle

package define

class A <: Exception {}

var a = if (true) {
    throw A();
    1
} else {
    1
}
