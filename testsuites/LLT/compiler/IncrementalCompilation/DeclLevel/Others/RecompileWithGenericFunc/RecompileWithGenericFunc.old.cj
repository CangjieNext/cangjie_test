extend<T> Array<T> {
    func foo(a:T):T {
        a
    }
}
main() {
    return test()
}

func test() : Int64 {
    let arr : Array<Int64> = [0, 1, 2]
    arr.foo(1)
}

func coo<T>(a: T) : T {
    return a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
