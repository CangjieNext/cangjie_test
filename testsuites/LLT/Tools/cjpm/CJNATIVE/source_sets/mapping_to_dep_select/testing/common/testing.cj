// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@NonProduct
features {}
package testing

public common func baz(x: Range<Int64>): String {
    "This is common baz function in package testing.:"
}

public func test_baz(): String {
    baz(0..10)
}
