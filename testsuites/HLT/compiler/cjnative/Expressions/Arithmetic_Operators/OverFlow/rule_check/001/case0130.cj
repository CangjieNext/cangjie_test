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
    func b() {
        var temp1: Int8 = 10
        var temp2: Int8 = 127 + temp1
    }
    b()
}

main() {
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
