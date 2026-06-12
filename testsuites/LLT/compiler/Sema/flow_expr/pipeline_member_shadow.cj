// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

// Guard for UsersForum issue #3282: inside an extend of a type that has a member
// function named `map`, the pipeline rhs `map { ... }` must still be able to
// resolve to the package-level `map` overload. Before the fix, ChkFlowExpr
// pre-synthesized the rhs without the flow context, name resolution picked the
// member (closer in scope), the rhs got a non-function type and the whole
// expression failed with "invalid binary operator '|>'". The fix retries the
// desugared flow call with cleared operands so the nested overload resolution
// runs under the expected function type. The runtime output pins that the
// package-level overload (not the member) is selected.

public interface I {
    func g(): Int64
}

public class MyIter<T> {}

public class MyList<T> {
    public func iterator(): MyIter<T> { return MyIter<T>() }
    // member shadowing the package-level map (mirrors stdlib ArrayList.map)
    public func map<R>(f: (T) -> R): MyList<R> {
        println("member map called")
        return MyList<R>()
    }
}

public func map<T, R>(f: (T) -> R): (MyIter<T>) -> MyIter<R> {
    println("free map called")
    return { it: MyIter<T> => MyIter<R>() }
}

public func collectArray<T>(it: MyIter<T>): Int64 { return 42 }

class C <: I {
    public func g(): Int64 { return 1 }
}

extend<T> MyList<T> <: I where T <: I {
    public func g(): Int64 {
        let a = this.iterator() |> map { v: T => v.g() } |> collectArray
        return a
    }
}

main() {
    let l = MyList<C>()
    println(l.g())
    return 0
}

/* SCAN
free map called
42
*/
