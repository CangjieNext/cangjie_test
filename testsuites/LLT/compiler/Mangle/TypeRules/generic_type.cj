// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @_CN7default6gfunc1IG_HG_
// (CJNATIVE) ASSERT: scan @_CN7default6gfunc2IG_G0_G1_HF0G0_G_EF0G1_G0_E
// (CJNATIVE) ASSERT: scan define void @_CN7default9testGSubIHCNY_5GSubIIlE
// (CJNATIVE) ASSERT: scan define void @\"_CN7default2GCIG_G0_E6<init>HG_G0_\"
// (CJNATIVE) ASSERT: scan define void @_CN7default5GPairIG_G0_E5firstHv
// (CJNATIVE) ASSERT: scan define void @_CN7default2GEIG_E10getOrThrowHv
// (CJNATIVE) ASSERT: scan define void @\"_CN7default1CIG_E6<init>Hv\"

// generic func
func gfunc1<T>(a: T): T {
    return a
}

// generic func
func gfunc2<T1, T2, T3>(f: (T1) -> T2, g: (T2) -> T3): (T1) -> T3 {
    return {x: T1 => g(f(x))}
}

// generic interface
public interface GBaseI<E> {
    func iterator(): GBaseI<E>
}

public interface GSubI<E> <: GBaseI<E> {
    func next(): Option<E>
}

func testGSubI(a: GSubI<Int64>) {}

// generic class
public open class GC<K, V> where K <: Hashable & Equatable<K> {
    public var key: Option<K> = Option<K>.None
    public var value: Option<V> = Option<V>.None

    public init() {}

    public init(key: K, value: V) {
        this.key = Option<K>.Some(key)
        this.value = Option<V>.Some(value)
    }
}

// generic struct
struct GPair<T, U> {
    let x: T
    let y: U
    public init(a: T, b: U) {
        x = a
        y = b
    }
    public func first(): T {
        return x
    }
    public func second(): U {
        return y
    }
}

// generic enum
public enum GE<T> {
    Some(T)
    | None

    public func getOrThrow(): T {
        match (this) {
            case Some(v) => v
            case None => throw NoneValueException()
        }
    }
}

// generic inheritance
interface I<X, Y> {}

class C<Z> <: I<Z, Z> {}

main() {
    let genericC = GC<Int64, Float64>()
    let genericS = GPair<String, Int64>("123", 1)
    let genericE = GE<Int64>.Some(1)
    let inheritanceC = C<Int64>()
    0
}
