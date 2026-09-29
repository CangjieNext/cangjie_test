// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

common open class WithFields {
    common init()
    common let abc: Int32
    common let ab: Int32
    common let a: Int32
    common let f0: Int32
    common let f1: Int32
}

func commonChecksum(w: WithFields): Int64 {
    var s: Int64 = 0
    s = s + Int64(w.abc)
    s = s + Int64(w.ab)
    s = s + Int64(w.a)
    s = s + Int64(w.f0)
    s = s + Int64(w.f1)
    return s
}
