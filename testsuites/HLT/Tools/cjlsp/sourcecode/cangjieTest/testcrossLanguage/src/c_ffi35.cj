/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
var count = 0

@C
func CCC_except_table0() {
    count += 1
}

@C
func CCC_except_table1() {
    count += 1
}

@C
func CCC_except_table2() {
    count += 1
}

@C
func CCC_except_table3() {
    count += 1
}

func test35() {
    unsafe {
        CCC_except_table0()
        CCC_except_table1()
        CCC_except_table2()
        CCC_except_table3()
    }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
