// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

common open class OrdField {
    common init()
    // Ordinary (unmarked) field of a common type: on the @JavaMirror specific side
    // it must become an FFI property backed by the Java field, even though it has
    // no `common`/`specific` modifier and no specific declaration.
    public var id: Int32
    public func getId(): Int32 {
        id
    }
}
