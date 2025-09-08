// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %compile_lib_opt %f 2>&1 | compare %f
// ASSERT: scan-not undeclared type name 'A'
// ASSERT: scan-not error

package pkgb

public class A {
    public func show(a: A): A {
        A()
    }
    public func test(): Int32 {
        0
    }
}
