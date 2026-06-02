// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %n.%suffix
// EXEC: %run %n.%suffix 2>&1 | compare %f
// ASSERT: scan 11
// ASSERT: scan hello


func cjfoo(f: CFunc<(Int64, CString) -> Unit>, t: (Int64, String)) {
    var n = t[0]
    unsafe {
        var s = LibC.mallocCString(t[1])
        f(n, s)
        LibC.free(s)
    }
}

main() {
    let f: CFunc<(Int64, CString) -> Unit> = { n: Int64, s: CString =>
        println(n)
        println(s.toString())
    }
    cjfoo(f, (11, "hello"))
}
