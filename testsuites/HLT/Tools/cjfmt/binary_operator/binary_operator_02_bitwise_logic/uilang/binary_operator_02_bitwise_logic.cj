/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func bits(x: Int64, y: Int64): Int64 {
    var m=x&y|x^y
    m <<= 2
    m|=y
    m&=x
    m^=7
    let s=x<<2>>1
    let z=-x+y
    let w2 = x - -x
    return m+s+z+w2
}

func logic(p: Bool, q: Bool, r: Bool, x: Int64, y: Int64): Bool {
    let v=p&&q||!r
    let w = p==q&&p!=r||x<y
    let u = ( p||q )&&( r||p )
    return v&&w||u
}

main() {
    println(bits(5, 3))
    println(logic(true, false, true, 1, 2))
}
