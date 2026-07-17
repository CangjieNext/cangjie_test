// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1a-1: 各 Kind 类型 + 基础类型数组 → CJFillMetadata getKnownTypeKind/getPrimitiveTypeName
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class MyClass { var v: Int64 = 0 }
struct MyStruct { var x: Int64 = 0 }
interface MyIface { func f(): Int64 }
enum MyEnum { A | B | C }
class GenericClass<T> {
    let v: T
    public init(v: T) { this.v = v }
}

func makeArrays(): Int64 {
    var sum: Int64 = 0
    let a1: Array<Int8> = [1, 2, 3]
    let a2: Array<Int16> = [1, 2, 3]
    let a3: Array<Int32> = [1, 2, 3]
    let a4: Array<Int64> = [1, 2, 3]
    let a5: Array<Bool> = [true, false, true]
    let a6: Array<Float32> = [1.0, 2.0, 3.0]
    let a7: Array<Float64> = [1.0, 2.0, 3.0]
    sum += Int64(a1[0]) + Int64(a2[0]) + Int64(a3[0]) + a4[0]
    if (a5[0]) { sum += 1 }
    sum += Int64(a6[0]) + Int64(a7[0])
    return sum
}

func useGenerics(): Int64 {
    let g = GenericClass<Int64>(1)
    let t = (1, "x")
    let arr: Array<Int64> = [0, 0]
    let r = 0..10
    return g.v + t[0] + arr[0] + Int64(r.end - r.start)
}

main(): Int64 {
    let s = makeArrays()
    let g = useGenerics()
    let e = MyEnum.A
    match (e) { case MyEnum.A => () case _ => () }
    if (s > 0 && g > 0) { return 0 }
    return 1
}
