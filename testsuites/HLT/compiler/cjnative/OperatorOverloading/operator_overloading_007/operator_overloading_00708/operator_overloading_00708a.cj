/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package operator_overloading_00708

struct A {
    public operator func *(b: A): Bool {
        return true
    }
}

class C {
    public operator func *(b: C): Bool {
        return true
    }
}

interface D {
    operator func *(b: D): Bool {
        return true
    }
}

class B <: D {}
