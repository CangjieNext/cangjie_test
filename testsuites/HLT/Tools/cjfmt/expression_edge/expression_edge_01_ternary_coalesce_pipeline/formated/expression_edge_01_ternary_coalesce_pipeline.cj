/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func double(x: Int64): Int64 {
    return x * 2
}

func inc(x: Int64): Int64 {
    return x + 1
}

func pick(flag: Bool, n: Int64): Int64 {
    let t2 = if (flag) {
        if (n > 0) {
            n
        } else {
            0
        }
    } else {
        1
    }
    var s: ?Int64 = None
    if (flag) {
        s = Some(n)
    }
    let v = s ?? 0
    let p = n |> double |> inc
    return t2 + v + p
}

main() {
    println(pick(true, 7))
    println(pick(false, 7))
}
