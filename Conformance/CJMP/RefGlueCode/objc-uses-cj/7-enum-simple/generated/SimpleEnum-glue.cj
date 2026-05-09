// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package objc.cjworld

import api.*
import objc.internal.*

@C
public func CJImpl_ObjC_api_SimpleEnum_OneInitCJObject(): RegistryId {
    unsafe { putToRegistry(SimpleEnum.One) }
}

@C
public func CJImpl_ObjC_api_SimpleEnum_TwoInitCJObject(): RegistryId {
    unsafe { putToRegistry(SimpleEnum.Two) }
}

@C
public func CJImpl_ObjC_api_SimpleEnum_ThreeInitCJObject(): RegistryId {
    unsafe { putToRegistry(SimpleEnum.Three) }
}

@C
public func CJImpl_ObjC_api_CJPrint(registryId: RegistryId): Unit {
    CJPrint(unsafe { getFromRegistryById<SimpleEnum>(registryId) } )
}
