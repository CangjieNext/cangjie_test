// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package a


public unsafe func foo<T>(fuzz_Func: (String) -> Unit) {
    var i = LibC.mallocCString("i")
    fuzz_Func(i.toString())
    LibC.free(i)
}
