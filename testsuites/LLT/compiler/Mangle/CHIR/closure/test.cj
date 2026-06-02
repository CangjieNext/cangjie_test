// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) LEVEL: 0
// (CJNATIVE and DEBUG_OPTION) EXEC: %frontendCompiler --dump-ir %f 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex define.* void @"_CCN7default4foo1HvEL_E\$g"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex define.* i64 @"_CCN7default4foo1HvEL_E\$i"

var a = 1

func foo1() {
    try {
        a++
    } finally {
        try {
            a++
        } finally {
            let x = {=> 0}
            x()
        }
    }
}

main() {
    0
}
