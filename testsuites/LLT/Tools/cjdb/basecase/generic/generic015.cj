// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(para: T) {
    var aaa: T = para
    let bbb: T = para
    0
}

main() {
    var arr: CString = unsafe { LibC.mallocCString("abc") }
    var acp: CPointer<UInt8> = arr.getChars()
    var rf = foo(acp)
    0
}
