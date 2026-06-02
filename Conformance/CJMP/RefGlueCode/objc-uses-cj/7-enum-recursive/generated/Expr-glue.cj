// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package objc.cjworld

import api.*
import objc.internal.*

@C
public func CJImpl_ObjC_api_Expr_NumInitCJObject(p1: Int64): RegistryId {
    let exprNum = Expr.Num(p1)
    unsafe { putToRegistry(exprNum) }
}

@C
public func CJImpl_ObjC_api_Expr_AddInitCJObject(registryIdL: RegistryId, registryIdR: RegistryId): RegistryId {
    let exprL = unsafe { getFromRegistryById<Expr>(registryIdL) }
    let exprR = unsafe { getFromRegistryById<Expr>(registryIdR) }
    let exprAdd = Expr.Add(exprL, exprR)
    unsafe { putToRegistry(exprAdd) }
}

@C
public func CJImpl_ObjC_api_Expr_SubInitCJObject(registryIdL: RegistryId, registryIdR: RegistryId): RegistryId {
    let exprL = unsafe { getFromRegistryById<Expr>(registryIdL) }
    let exprR = unsafe { getFromRegistryById<Expr>(registryIdR) }
    let exprSub = Expr.Sub(exprL, exprR)
    unsafe { putToRegistry(exprSub) }
}

@C
public func CJImpl_ObjC_api_Expr_deleteCJObject(registryId: RegistryId): Unit {
    unsafe { removeFromRegistry(registryId) }
}

@C
public func CJImpl_ObjC_api_CJEval(registryId: RegistryId): Unit {
    CJEval(unsafe { getFromRegistryById<Expr>(registryId) } )
}
