// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff unused %f

@C
func foo(a: Int64, b: VArray<CString, $1>): Unit {

}

main() {
    unsafe {
        var a = 1
        var ck: CString = LibC.mallocCString("hello")
        var f: VArray<CString, $1> = [ck]
        foo(a, inout f)
    }
}