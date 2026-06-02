/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface MyInterface1<T> {
    prop b1: UIntNative {
        get() {
            1
        }
    }
}

interface MyInterface2<T> {
    prop b2: UIntNative {
        get() {
            2
        }
    }
}

interface MyInterface3<T> {
    prop b3: UIntNative {
        get() {
            3
        }
    }
}

extend<T> Option<T> <: MyInterface1<UIntNative> & MyInterface2<UIntNative> & MyInterface3<UIntNative> {}

main() {
    var u1: MyInterface1<UIntNative> = Some(1)
    var u2: MyInterface2<UIntNative> = Some(1)
    var u3: MyInterface3<UIntNative> = Some(1)
    var u4: Option<Rune> = Some(r'1')
    print(u1.b1.toString())
    if (u1.b1 == 1 && u2.b2 == 2 && u3.b3 == 3 && u4.b1 == 1 && u4.b2 == 2 && u4.b3 == 3) {
        return 0
    } else {
        return 1
    }
}
