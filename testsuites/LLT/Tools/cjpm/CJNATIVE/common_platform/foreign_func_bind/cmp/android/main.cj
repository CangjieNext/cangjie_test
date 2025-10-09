// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

foreign func test01(tag: CString, message: CString): Unit 

platform func getInfo(): String {
    unsafe {
        test01(LibC.mallocCString("TEST"), LibC.mallocCString("Android platform func"))
    }
    "android getInfo()"
}