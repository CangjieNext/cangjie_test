// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import ffi.c.*

foreign func printf(fmt: CString, ...) : Int32

main() : Int64 {
    var s = unsafe { LibC.mallocCString("%d %d %d %d %d %d\n") }
    unsafe{ printf(s, 1, 2, 3, 4, 5, 6) }
    LibC.free(s)
    0
}