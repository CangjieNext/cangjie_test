// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public var arr1 = [1, 2, 3, 4, 5, 6]
public var arr2 = [[11, 22, 33], [44, 55, 66]]
public let arr3 = Array<Bool>(5, repeat: true)

public func foo() {
    return arr1[1..4]
}
