/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*
import std.collection.*
import std.sort.SortExtension

@Test
class Test {
    var arr = Array<String>()

    @TestCase
    func testPrimitive(): Unit {
        arr = TypeInfo.of<Int8>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Int16>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Int32>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Int64>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<IntNative>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<UInt8>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<UInt16>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<UInt32>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<UInt64>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<UIntNative>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Float16>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Float32>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Float64>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Bool>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<Rune>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open]")
        arr = TypeInfo.of<I1>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open]")
        arr = TypeInfo.of<I2>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open, sealed]")
        arr = TypeInfo.of<I3>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open, sealed]")
        arr = TypeInfo.of<I4>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open]")
        arr = TypeInfo.of<I5>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C1>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C2>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract, open, sealed]")
        arr = TypeInfo.of<C3>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract]")
        arr = TypeInfo.of<C4>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open]")
        arr = TypeInfo.of<C5>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C6>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C7<String, UInt64, Float32, Unit>>().modifiers |> map {a: ModifierInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C8>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S1>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S2>().modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
}
