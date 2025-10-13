// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func open(pathname: CString, oflags: Int32): Int32
main() {
var pathname = unsafe { LibC.mallocCString("./hello.txt") }
var oflags = Int32(0)
var handle = unsafe { open(pathname, oflags) };
LibC.free(pathname)
}
