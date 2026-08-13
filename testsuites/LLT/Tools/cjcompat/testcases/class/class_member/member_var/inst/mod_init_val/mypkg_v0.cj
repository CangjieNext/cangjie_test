// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public class Foo1 {
    const init() {}

    public let v1 = 1
    protected let v2 = 2
    internal let v3 = 3
    private let v4 = 4
}

public class Foo2 {
    @Frozen
    init() {}

    public let v1 = 1
    protected let v2 = 2
    internal let v3 = 3
    private let v4 = 4
}

public class Foo3 {
    public let v1 = 1
    protected let v2 = 2
    internal let v3 = 3
    private let v4 = 4
}

public class Foo4 {
    public let v1 = 1
    protected let v2 = 2
    internal let v3 = 3
    private let v4 = 4
}
