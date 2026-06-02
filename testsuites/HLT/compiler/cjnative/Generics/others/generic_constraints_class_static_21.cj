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

main(): Int64 {
    if (Coo<Boo<Aoo>, Aoo>().a != "abc") {
        return 2
    }
    return 0
}

class Coo<T, V> where T <: Boo<V> {
    public prop a: String {
        get() {
            return T.foo().foo()
        }
    }
}

class Boo<V> where V <: Aoo {
    public static func foo(): Aoo {
        return Aoo()
    }
}

class Aoo {
    public func foo() {
        return "abc"
    }
}
