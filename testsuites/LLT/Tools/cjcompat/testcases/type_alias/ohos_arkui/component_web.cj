// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

foreign func free(src: CString): Unit

type VectorStringHandle = CPointer<Unit>

@C
public struct ExternalString {
    let value_: CString
    let free_: CFunc<(CString) -> Unit>
    public init(value: String) {
        unsafe {
            value_ = LibC.mallocCString(value)
            free_ = free
        }
    }
}

public class PermissionRequest {
    let cDeny: CFunc<(CPointer<Unit>) -> Unit>
    let cGetOrigin: CFunc<(CPointer<Unit>) -> ExternalString>
    let cGetAccessibleResource: CFunc<(CPointer<Unit>) -> VectorStringHandle>
    let cGrant: CFunc<(VectorStringHandle, CPointer<Unit>) -> Unit>
    let cPermission: CPointer<Unit>
    let cFree: CFunc<(CPointer<Unit>) -> Unit>
    init(
        cDeny: CFunc<(CPointer<Unit>) -> Unit>,
        cGetOrigin: CFunc<(CPointer<Unit>) -> ExternalString>,
        cGetAccessibleResource: CFunc<(CPointer<Unit>) -> VectorStringHandle>,
        cGrant: CFunc<(VectorStringHandle, CPointer<Unit>) -> Unit>,
        cPermission: CPointer<Unit>,
        cFree: CFunc<(CPointer<Unit>) -> Unit>
    ) {
        this.cDeny = cDeny
        this.cGetOrigin = cGetOrigin
        this.cGetAccessibleResource = cGetAccessibleResource
        this.cGrant = cGrant
        this.cPermission = cPermission
        this.cFree = cFree
    }
}
