/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public operator func !(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func -(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func [](b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func **(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func *(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func /(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func %(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func +(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func <<(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func >>(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func <(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func <=(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func >(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func >=(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func ==(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func !=(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func &(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func ^(b: A<T>, c: A<T>): Bool {
        true
    }
    public operator func |(b: A<T>, c: A<T>): Bool {
        true
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
