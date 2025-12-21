// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: common with const and foreign should be conflicted
// EXEC-PIPE-0: %compiler %diag_json --experimental %f --output-type=chir 2>&1 | compare %f
// ASSERT: scan-not error

package cmp

common func foo<T>(): Unit{}

common class A0 {
    common func foo<T>(): Unit{}
    init() {}
}

common class A1<T> {
    common func foo(): Unit{}
    init() {}
}

