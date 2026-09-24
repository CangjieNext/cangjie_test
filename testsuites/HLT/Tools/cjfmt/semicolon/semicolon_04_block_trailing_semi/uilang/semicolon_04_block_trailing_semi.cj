/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func g(n: Int64): Int64 {
    var m = n
    if (n > 0) {
        return 1;
    }
    while (m > 10) {
        m = m - 1
    };
    return m;
}

func h(n: Int64): Int64 {
    if (n > 0) {
        return 2;
    }
    return 3;
}

func a1(n: Int64): Int64 {
    var m = n;
    if (m > 0) {
        m = m + 1
    };
    return m;
}

func a2(n: Int64): Int64 {
    var t = 0
    for (i in 0..n) {
        t += i
    };
    return t;
}

func a3(): Int64 {
    var v = 1
    do {
        v = v + 1
    } while (v < 3);
    return v;
}

func a4(): Int64 {
    return 9;
};

main() {
    println(g(20))
    println(h(1))
    println(a1(5))
    println(a2(4))
    println(a3())
    println(a4())
}
