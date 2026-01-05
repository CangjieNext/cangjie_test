/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj
import interoplib.interop.*
import java.lang.*

public class A<T> {
    private var value: (T)->Int32
    public A(v: (T)->Int32, a: T) {
        print("CJ: at ctor\n", flush:true)
        value = v
        print("CJ: A test value(a) ${value(a)}\n", flush: true)
    }

    public func test(a: T, fun : (T) -> Int32): (Int32) -> T {
        let c = fun(a)
        print("CJ: A test: ${c}\n", flush: true)
        return {b:Int32 => a}
    }
}

public struct S<T> { 
    private var value: (T)->Int32
    public S(v: (T)->Int32, a: T) {
        print("CJ: at ctor\n", flush:true)
        value = v
        print("CJ: S test value(a) ${value(a)}\n", flush: true)
    }

    public func test(a: T, fun : (T) -> Int32): (Int32) -> T {
        let c = fun(a)
        print("CJ: S test: ${c}\n", flush: true)
        return {b:Int32 => a}
    }
}


public interface I<T, R> {
    func goo(v:(T)->R, a: T) : (T)->R {
        let b = v(a)
        return {d:T => b}
    }

    func foo(v: (T)->R) : Unit
}

public enum TimeUnit<T> {
    | Year(T)
    
    public func NumCalcMonth(b : T, a : (T) -> Int32): (Int32) -> T {
        let s :Int32 = match (this) {
            case Year(n) => a(n)
        }
        print("CJ: at TimeUnit NumCalcMonth(): ${s}\n", flush:true)
        return {c:Int32=> b}
    }
}