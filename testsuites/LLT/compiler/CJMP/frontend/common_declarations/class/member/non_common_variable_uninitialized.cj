// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan-3 sema_type_uninitialized_static_field
// ASSERT: scan-3 sema_class_uninitialized_field
package cmp

public common class A0 {
    static let y0: String
    init() {}
}

public common class B0 {
    static let y1: String
    static init() {}
}

public common class C0 {
    static let y2: String
    init() {}
}

public common class A1 {
    let y3: String
    init() {}
}

public common class B1 {
    let y4: String
    static init() {}
}

public common class C1 {
    let y5: String
    init() {}
}

