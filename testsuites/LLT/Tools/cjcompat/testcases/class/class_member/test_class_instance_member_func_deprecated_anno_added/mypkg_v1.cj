// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public class Foo {
    @Deprecated["This API is deprecated", strict: true]
    public func f(): Unit {
    }
    @Deprecated["This API is deprecated"]
    protected func f2(): Unit {
    }
}

public abstract class Bar {
    @Deprecated["This API is deprecated"]
    public func bar(): Unit
    @Deprecated["This API is deprecated", strict: true]
    protected func bar2(): Unit
}

main() {}