/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

public func a() {
    var x: Int8 = 10
    if (true) {
        if (true) {
            if (true) {
                x += 20
            } else {
                x += 20
            }
        } else {
            x += 20
        }
    } else {
        x += 20
    }
    let y: Int8 = x + 100
}

main() {
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_arithmetic_operator_overflow
