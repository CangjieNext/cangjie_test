// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %diag_json %f 2>&1 | compare %f

class MyClass<T> {
    func add(t: T) {}
}

func bar<T>(f: (MyClass<T>) -> Unit): Unit {
    return f(MyClass<T>())
}

func foo() {
    bar { it =>
        func local<T>(t: T) {
            it.add(t)
        }
    }
}

main() {
    foo()
}

// ASSERT: scan parameters of this lambda expression must have type annotations
// ASSERT: scan unable to infer generic argument of this function
// ASSERT: scan no information known for type variable 'Generics-T'
// ASSERT: scan "Errors": 2

