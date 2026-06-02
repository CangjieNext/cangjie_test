/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface1<T> {
    prop b1: UIntNative {
        get() {
            1
        }
    }
}

public interface MyInterface2<T> {
    prop b2: UIntNative {
        get() {
            2
        }
    }
}

public interface MyInterface3<T> {
    prop b3: UIntNative {
        get() {
            3
        }
    }
}

extend<T> Option<T> <: MyInterface1<UIntNative> & MyInterface2<UIntNative> & MyInterface3<UIntNative> {}
