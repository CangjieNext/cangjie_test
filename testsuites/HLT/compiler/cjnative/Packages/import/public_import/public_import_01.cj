/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt define.cj -o define.%middle
// EXEC: %compiler %cmp_opt %f define.%middle -o %output

package test

public import define.*

main() {
    return M()
}
