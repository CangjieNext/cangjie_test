// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public class Foo<T,K> {
    var item: T
    init(it: T) {
        item = it
    }
}

extend<T1,T2> Foo<T1,T2> {
    public func equals() {
        true
    }
}