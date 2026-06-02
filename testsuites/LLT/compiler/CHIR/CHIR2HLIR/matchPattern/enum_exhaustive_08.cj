// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-3: %run %run_opt %output %run_args

enum MyList<T> {
    | Nil
    | Cons(T, MyList<T>)

    public func length(): UInt64 {
        match (this) {
            case Nil => 0
            case Cons(_, tail) => 1 + tail.length()
        }
    }
}

main() {
    let lst = Cons(1, Cons(2, Cons(3, MyList<Int64>.Nil)))
    lst.length()
}
