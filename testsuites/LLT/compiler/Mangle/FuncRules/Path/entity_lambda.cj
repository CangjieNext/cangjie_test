// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN13entity_lambda3fooHiEL_1yK_E
package entity_lambda

func foo(i: Int32) {
    let x = {
        =>
        // 此处的 y 变量 mangle 名为：_CN13entity_lambda3fooHiEL_1yK_E
        const y = 1
    }
}

main() {
    0
}
