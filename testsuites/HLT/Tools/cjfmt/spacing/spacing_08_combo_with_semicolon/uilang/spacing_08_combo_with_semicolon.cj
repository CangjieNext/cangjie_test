/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Sp {
    public static let s: Int64 = 1
    var v: Int64 = 0
    public init() {
    }
    public func add(a: Int64, b: Int64): Int64 {
        return a + b;
    }
}

func top(n: Int64): Int64 {
    let a = 1;
    let b = 2;
    let c = a + b;
    let d = 3;
    let e = 4;
    return c + d + e + n;
}

main() {
    let t = (1, 2);
    let z = Sp();
    println(z.add(1, 2));
    println(top(t[0]));
}
