/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(n: Int64): Int64 {
    let a = 1;
    let b = 2;

    return a + b + n;
}

func g(): Int64 {
    var t = 0;
    let c = 1;
    let d = 2;
    t = c + d

    return t;
}

main() {
    println(f(3));
    println(g());
}
