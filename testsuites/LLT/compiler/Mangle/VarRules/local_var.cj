// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN7default3fooHvE1xK_E
// (CJNATIVE) ASSERT: scan @_CN7default3fooHvE1xK0_E

func foo() {
    if (true) {
        // 此处的 x 变量的 mangle 名为：_CN<path>1xK_E
        const x = 1
    } else {
        // 此处的 x 变量的 mangle 名为：_CN<path>1xK0_E
        const x = 2
    }
}
