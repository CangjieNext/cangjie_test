// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public var tup1 = (1, 2.0, true, 'a', "hello")
public var tup2 = (tup1, (1, 'a'))

public func foo() {
    return tup2[0]
}
