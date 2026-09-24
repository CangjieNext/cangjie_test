/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C {
    let x: Int64 = 1;
    var y: Int64 = 2;

    public func m(): Int64 {
        return x + y;
    }
};

var g1: Int64 = 3;

let g2: Int64 = 4;

func f(): Int64 {
    return g1 + g2;
}

main() {
    println(C().m());
    println(f());
}
