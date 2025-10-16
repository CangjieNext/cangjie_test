/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

foreign func PassPointerToCangjie(): CPointer<Int8>

class A {
    func foo() {
        var a: CPointer<Int8> = unsafe { PassPointerToCangjie() }
        var b: CPointer<Int8> = CPointer<Int8>(a)
    }
}

