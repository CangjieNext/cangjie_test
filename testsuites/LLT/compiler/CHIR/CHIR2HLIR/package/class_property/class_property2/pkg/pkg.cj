// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public var a: Int32 = 1
public var b: Int32 = 1
public var c: Int32 = 1

public interface A {
    mut prop m: Int32 {
        get() {
            return (a)
        }
        set(input) {
            a = input + 1
        }
    }
}

public class B <: A {}

public class C {}

extend C <: A {
    public mut prop n: Int32 {
        get() {
            return (b)
        }
        set(input) {
            b = input + 1
        }
    }
}

public struct D {}

extend D {
    public mut prop n: Int32 {
        get() {
            return (c)
        }
        set(input) {
            c = input + 1
        }
    }
}

public class F {
    public static var c: Int32 = 1
}

extend F {
    public mut static prop n: Int32 {
        get() {
            return (c)
        }
        set(input) {
            c = input + 1
        }
    }
}
