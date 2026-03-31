
// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public struct X<T> { }
public interface Constraint<T> {}

struct S { }
class C { }
enum E { value }
struct G<T> { }
interface I { }
type A = String

common extend <T> X<T>
    where T <:
        Constraint<Unit> & 
        Constraint<Int8> & 
        Constraint<Int16> & 
        Constraint<Int32> & 
        Constraint<Int32> & 
        Constraint<Int64> & 
        Constraint<IntNative> &
        Constraint<Int> &
        Constraint<UInt8> & 
        Constraint<UInt16> & 
        Constraint<UInt32> & 
        Constraint<UInt32> & 
        Constraint<UInt64> & 
        Constraint<UIntNative> &
        Constraint<UInt> &
        Constraint<Float16> &
        Constraint<Float32> &
        Constraint<Float64> &
        Constraint<Rune> & 
        Constraint<Nothing> & 
        Constraint<Bool> &
        Constraint<(Int64, Int64)> &
        Constraint<E> &
        Constraint<() -> Unit> &
        Constraint<S> &
        Constraint<Array<Int64>> &
        Constraint<VArray<Int64, $2>> &
        Constraint<CPointer<Int64>> &
        Constraint<CString> &
        Constraint<C> &
        Constraint<I> &
        Constraint<A> &
        Constraint<G<Int64>>
    { }

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib -o %output 
package cmp

specific extend <T> X<T>
    where T <:
        Constraint<Unit> & 
        Constraint<Int8> & 
        Constraint<Int16> & 
        Constraint<Int32> & 
        Constraint<Int32> & 
        Constraint<Int64> & 
        Constraint<IntNative> &
        Constraint<Int> &
        Constraint<UInt8> & 
        Constraint<UInt16> & 
        Constraint<UInt32> & 
        Constraint<UInt32> & 
        Constraint<UInt64> & 
        Constraint<UIntNative> &
        Constraint<UInt> &
        Constraint<Float16> &
        Constraint<Float32> &
        Constraint<Float64> &
        Constraint<Rune> & 
        Constraint<Nothing> & 
        Constraint<Bool> &
        Constraint<(Int64, Int64)> &
        Constraint<E> &
        Constraint<() -> Unit> &
        Constraint<S> &
        Constraint<Array<Int64>> &
        Constraint<VArray<Int64, $2>> &
        Constraint<CPointer<Int64>> &
        Constraint<CString> &
        Constraint<C> &
        Constraint<I> &
        Constraint<A> &
        Constraint<G<Int64>>
    { }
