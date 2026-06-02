/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public class A<T> {
    public static var a: Option<Int32> = None
    public mut static prop m: Option<Int32> {
        get() {
            return a
        }
        set(input) {
            a = input
        }
    }
    public static prop n: Option<Int32> {
        get() {
            return a
        }
    }
}

public class C<T> {
    public static var a: Int32 = 1
    public mut static prop m: Int32 {
        get() {
            return a
        }
        set(input) {
            a = input + 1
        }
    }
    public static prop n: Int32 {
        get() {
            return (a * 2)
        }
    }
}
