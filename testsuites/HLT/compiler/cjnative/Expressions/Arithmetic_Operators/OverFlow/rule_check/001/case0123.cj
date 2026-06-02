/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan chir_arithmetic_operator_overflow

public func a() {
    let a: Int8 = 10
    func b() {
        var b: Int8 = 127 + a
    }
    b()
}

main() {
    a()
    return 0
}
