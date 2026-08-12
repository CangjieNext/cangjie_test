// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan LazyNode.map

class LazyNode<T> {
    func map<U>(body: (T)->U): LazyNode<U> {
        println("LazyNode.map")
        LazyNode<U>()
    }
}

public class LazySeq<T> {
    let a = LazyNode<T>()
    public func map<U>(body: (T)->U): LazySeq<U> {
        LazyNode<T>().map<U>(body)
        LazySeq<U>()
    }
}

main() {
    var a = LazySeq<String>()
    a.map<Int64>({a=>1})
    0
}

