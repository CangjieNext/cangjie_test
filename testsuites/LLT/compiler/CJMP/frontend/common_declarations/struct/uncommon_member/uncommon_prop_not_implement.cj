// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: a common class without explicit constructors and has instance is error
// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan-2 sema_property_must_have_accessors
package cmp

common class Foo {
    private var a = 0
    mut prop b: Int64{}
    prop c:Int64{}
    init() {}
}


