foreign func PassPointerToCangjie(): CPointer<IntNative>

struct A {
    func foo() {
        var a: CPointer<IntNative> = unsafe { PassPointerToCangjie() }
        var b: CPointer<Int16> = CPointer<Int16>(a)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
