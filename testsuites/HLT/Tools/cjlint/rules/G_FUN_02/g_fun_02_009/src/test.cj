/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func apply(f: (Int64) -> Int64, x: Int64): Int64 {
    return x
}

main() {
    let r = apply({ v: Int64 => v * 2 }, 5)
    println(r)
}
