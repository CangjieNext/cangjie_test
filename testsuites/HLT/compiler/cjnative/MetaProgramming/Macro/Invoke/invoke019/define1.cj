/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro Parallel001(input: Tokens): Tokens {
    let fut = spawn {
        let c = quote(
            $input
        )
        c
    }
    let res = fut.get()
    return res
}

public macro Parallel002(input: Tokens): Tokens {
    let thread = 10
    let futs = Array<Future<Tokens>>(thread) {
        _ => spawn {
            let c = quote(
                $input
            )
            c
        }
    }
    var res: Tokens = quote()
    for (i in 0..thread) {
        res = futs[i].get()
    }
    return res
}
