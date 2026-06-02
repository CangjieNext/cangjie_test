// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt  -Woff unused %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// No run, check error

func a(): Int8 {
    return 20
}

func test() {
    let b: Int8 = 120 + 20
    return b
}

main() {
    test()
    return 0
}

// ASSERT: scan overflow
