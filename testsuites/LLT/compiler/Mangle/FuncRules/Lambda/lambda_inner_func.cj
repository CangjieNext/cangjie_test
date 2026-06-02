// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal i64 @_CN17lambda_inner_func3fooHvEL_E
// (CJNATIVE) ASSERT: scan define internal i64 @_CN17lambda_inner_func3fooHvEL0_E
// (CJNATIVE) ASSERT: scan define internal i64 @_CN17lambda_inner_func3fooHvEL1_E

package lambda_inner_func

func foo() {
    // 此处的 lambda 函数的 mangle 名为：_CN<path>L_E
    let x = {=> 0}
    // 此处的 lambda 函数的 mangle 名为：_CN<path>L0_E
    let y = {=> 0}
    // 此处的 lambda 函数的 mangle 名为：_CN<path>L1_E
    let z = {=> 0}
    return (x, y, z)
}

main() {
    let (x, y, z) = foo()
    0
}
