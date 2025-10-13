// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

type Param = Int64

public class D {
    public D(public var z!: Param = 3) {
        this.z = z + 2
    }
}

public class C {
    public C(public var x!: Rune = r'z') {}
}

public class F {
    public F(public var x!: Bool = true) {}
}

public class G {
    public G(public var a: Int32, public var b!: Int32 = 8) {}
}

public struct Date {
    public Date(public let width!: Int32 = 1, public let length!: Int32 = 2,
        public let perimeter!: () -> Int32 = {
            =>
            var res: Int32 = 1;
            return res
        }) {}
}
