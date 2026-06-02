// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package pkg

foreign func foo(ptr: CPointer<Unit>, idx: Int64, name: CString): Unit

public unsafe func getTableField<T>(ptr: CPointer<Unit>, index: Int64, name: String): T where T <: ToString {
    var t: ?T = None
    let cName = LibC.mallocCString(name)
    foo(ptr, index, cName)
    LibC.free(cName)
    t.getOrThrow()
}
