// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// mock std.core：RawArray intrinsic / arrayInitBy* + codegen 隐式依赖（createOverflowExceptionMsg、throwImplicitException）。
package std.core

public interface Any {}

public open class Object <: Any {
    public const init() {}
}

sealed interface CType {}

@ConstSafe
const EMPTY_UINT8_RAW_ARRAY: RawArray<UInt8> = rawArrayAllocate<UInt8>(0)

public struct String {
    let myData: RawArray<UInt8>
    let start: UInt32
    let length: UInt32

    public const init() {
        (myData, start, length) = (EMPTY_UINT8_RAW_ARRAY, 0u32, 0u32)
    }
}

public open class Exception {
    public init() {}
    public init(message: String) {}
}

public open class ArithmeticException <: Exception {
    public init() {
        super()
    }
    public init(message: String) {
        super(message)
    }
}

public class OverflowException <: ArithmeticException {
    public init() {
        super()
    }
    public init(message: String) {
        super(message)
    }
}

public class IndexOutOfBoundsException <: Exception {
    public init() {
        super()
    }
}

@Intrinsic
func arrayGet<T>(rawArr: RawArray<T>, index: Int64): T

@Intrinsic
func arraySet<T>(rawArr: RawArray<T>, index: Int64, element: T): Unit

@Intrinsic
func arraySize<T>(rawArr: RawArray<T>): Int64

@Intrinsic
func rawArrayAllocate<T>(size: Int64): RawArray<T>

@Intrinsic
func rawArrayInitByValue<T>(rawArr: RawArray<T>, size: Int64, initValue: T): Unit

@Frozen
@OverflowWrapping
func arrayInitByFunction<T>(array: RawArray<T>, initElement: (Int64) -> T): RawArray<T> {
    var i: Int64 = 0
    while (i < arraySize(array)) {
        arraySet(array, i, initElement(i))
        i++
    }
    return array
}

func createOverflowExceptionMsg(msg: String): OverflowException {
    OverflowException(msg)
}

@C
func throwImplicitException(id: Int64, args: CPointer<Unit>): Unit {}
