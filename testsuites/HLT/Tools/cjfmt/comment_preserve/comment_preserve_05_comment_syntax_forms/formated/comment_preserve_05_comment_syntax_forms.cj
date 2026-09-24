/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Doc {
    // class-level note
    var v: Int64 = 0
    /* block comment
       still inside block */
    public init() {
    }
    public func inc(): Int64 {
        // misindented full-line comment
        v = v + 1 /* trailing block */
        return v // line tail
    }
}
// top note after class
main() {
    /* comment // with slashes inside */
    let x = Doc()
    x.inc()
    // final note
}
