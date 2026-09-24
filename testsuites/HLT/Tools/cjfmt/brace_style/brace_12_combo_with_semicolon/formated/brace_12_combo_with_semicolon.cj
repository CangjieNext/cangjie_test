/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Semi {
    var n: Int64 = 0;
    public init() {
    }
    public func inc(): Int64 {
        n = n + 1
        return n;
    }
}

func accumulate(x: Int64): Int64 {
    var t = 0;
    let a = 1;
    let b = 2;
    t = a + b
    return t + x;
}

main() {
    let s = Semi();
    println(s.inc());
    println(accumulate(3));
}
