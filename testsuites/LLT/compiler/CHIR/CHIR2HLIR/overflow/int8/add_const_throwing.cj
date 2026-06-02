// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt --int-overflow throwing %enableCompileDebug %f %diag_json -o %n.%suffix

@OverflowWrapping
func test() {
    let _: Int8 = 127 + 1 //  wrapping
    let _ = @OverflowThrowing {
        =>
        let a: Int8 = 127 + 1
        a
    }
}

main() {
    let _: Int8 = 127 + 5
    test()
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
