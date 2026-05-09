// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package objc.cjworld

import api.*
import objc.internal.*

@C
public func CJImpl_objc_cjworld_Vector_dot(registryId: RegistryId, anotherRegistryId: RegistryId): Int64 {
    unsafe {
        getFromRegistryById<Vector>(registryId).dot(
            getFromRegistryById<Vector>(anotherRegistryId)
        )
    }
}

@C
public func CJImpl_objc_cjworld_Vector_initCJObject(x: Int32, y: Int32): RegistryId {
    unsafe {
        putToRegistry(Vector(x, y))
    }
}

@C
public func CJImpl_objc_cjworld_Vector_X_get(registryId: RegistryId): Int32 {
    unsafe {
        getFromRegistryById<Vector>(registryId).x
    }
}

@C
public func CJImpl_objc_cjworld_Vector_Y_get(registryId: RegistryId): Int32 {
    unsafe {
        getFromRegistryById<Vector>(registryId).y
    }
}

@C
public func CJImpl_objc_cjworld_Vector_deleteCJObject(registryId: RegistryId): Unit {
    unsafe {
        removeFromRegistry(registryId)
    }
}
