// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public open class Date2 {
    public Date2(public let v!: Int32 = 1, public let length!: Int32 = 2,
        public let perimeter!: () -> Int32 = {
            =>
            var res: Int32 = 2;
            return res
        }) {}
}

public class Date4 {
    public Date4(public let width!: Int32 = 1, public let length!: Int32 = Date2().v,
        public let perimeter!: () -> Int32 = {
            =>
            var res: Int32 = Date2().v;
            return res
        }) {}
}

public class Date5 <: Date2 {
    public Date5(public let width!: Int32 = 1, public let length5!: Int32 = Date2().v,
        public let perimeter5!: () -> Int32 = {
            =>
            var res: Int32 = Date2().v;
            return res
        }) {}
}

public class B {
    public B(public var xa!: Bool = false, public let ai!: Bool = xa && true, public var x!: Int32 = 2 + Date2().v) {}
}

public class G {
    public var x: Int32
    public G(xa!: Bool = true, ai!: Bool = xa && true, c!: Int32 = 3, x!: Int32 = 2 + Date2().v + c) {
        this.x = x
    }
}
