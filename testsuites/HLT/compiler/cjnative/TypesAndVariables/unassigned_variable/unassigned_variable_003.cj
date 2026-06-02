/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
    TestPoint: 测试未赋值变量在一些表达式结构中的使用
 */

class C1 {
    static var boolean1 = false
    static var boolean2 = true
    var boolean3 = true
}

main() {
    let a: Int64
    let b = 0
    if (C1.boolean1) {
        match (b) {
            case 1 => a = 1
            case 2 | 3 => a = 100
            case _ => a = -1
        }
    } else if (C1.boolean2) {
        a = match {
            case _ => 0
        }
    } else {
        if (C1().boolean3) {
            a = 2
        } else {
            a = 3
        }
    }
    a
}
