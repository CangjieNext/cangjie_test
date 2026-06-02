/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
import std.ast.*

public func check(a:Tokens,b:Tokens):Int64{
    if (a.size != b.size) { // a have END
        print("ERROR: size not equal!")
        a.dump()
        b.dump()
        return 1
    }
    for (i in 0..b.size) {
        var res_a = a[i]
        var res_b = b[i]
        var x = res_a
        var y = res_b
        let xk = x.kind
        let yk = y.kind
        var res =  xk == yk && x.value == y.value
        if (!res) {
            print("ERROR: token not equal!")
            x.dump()
            y.dump()
            return 1
        }
    }
    return 0
}
