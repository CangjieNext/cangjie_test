// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public class Foo {
    const init() {
    }

    const public func f(): Unit {
    }

    const protected func f2(): Unit {
    }
}

public abstract class Bar {
    const init() {
    }

    const public func bar(): Unit
    const protected func bar2(): Unit
}

public class Baz {
    const init() {
    }

    const public func f(): Unit {
        f2();
    }

    const func f2(): Unit {
    }
}

main() {}