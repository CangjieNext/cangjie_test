// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package objc.cjworld

import api.*
import objc.internal.*

@C
public func CJImpl_objc_cjworld_NonOpen_initCJObject(): RegistryId {
    unsafe { putToRegistry(NonOpen()) }
}

@C
public func CJImpl_objc_cjworld_NonOpen_Foo(registryId: RegistryId): Unit {
    unsafe { getFromRegistryById<NonOpen>(registryId).Foo() }
}

@C
public func CJImpl_objc_cjworld_NonOpen_deleteCJObject(registryId: RegistryId): Unit {
    unsafe { removeFromRegistry(registryId) }
}
