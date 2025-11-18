/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-0: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1

protected class CTypeResource<T> <: Resource where T <: CType {
    protected CTypeResource(
        protected let value: T,
        protected let free: () -> Unit
    ) {}
    protected let isFree: Box<Bool> = Box(false)

    public func isClosed(): Bool {
        return isFree.value
    }

    public func close(): Unit {
        if (isFree.value) {
            return
        }
        this.free()
        isFree.value = true
    }
}

@C
protected struct CArrFloat32 {
    protected CArrFloat32(
        protected var size: Int64
    ) {}

    protected func free(): Unit {
    }

    protected func asResource(): CTypeResource<CArrFloat32> {
        return CTypeResource(this, free)
    }

}
