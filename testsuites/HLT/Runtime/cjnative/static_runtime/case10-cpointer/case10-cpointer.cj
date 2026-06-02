/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.cpp
// (not Windows and not MAC) EXEC: %clang -c %clang_opt %n.cpp -o lib%n.cpp.cfile.%dylib_suffix
// (not Windows and not MAC) EXEC: %compiler -L. -l%n.cpp.cfile %f %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping -o %output
// (not Windows and not MAC) RUN-EXEC: unset LD_LIBRARY_PATH && %output %run_args

foreign func PassCPointerToC(a: CPointer<Float32>): Bool

foreign func FreeAllPointer(): Unit

foreign func getCPtrInt(): CPointer<Float32>

foreign func getCPtrVoid(): CPointer<Unit>

foreign func getCPtrBool(): CPointer<Bool>

foreign func getCPtrChar(): CPointer<Int8>

foreign func getCPtrInt8(): CPointer<Int8>

foreign func getCPtrInt16(): CPointer<Int16>

foreign func getCPtrInt32(): CPointer<Int32>

foreign func getCPtrInt64(): CPointer<Int64>

foreign func getCPtrUInt8(): CPointer<UInt8>

foreign func getCPtrUInt16(): CPointer<UInt16>

foreign func getCPtrUInt32(): CPointer<UInt32>

foreign func getCPtrUInt64(): CPointer<UInt64>

foreign func getCPtrFloat32(): CPointer<Float32>

foreign func getCPtrFloat64(): CPointer<Float64>

foreign func passCPtrVoid(a: CPointer<Unit>): CPointer<Unit>

foreign func passCPtrBool(a: CPointer<Bool>): CPointer<Bool>

foreign func passCPtrChar(a: CPointer<Int8>): CPointer<Int8>

foreign func passCPtrInt8(a: CPointer<Int8>): CPointer<Int8>

foreign func passCPtrInt16(a: CPointer<Int16>): CPointer<Int16>

foreign func passCPtrInt32(a: CPointer<Int32>): CPointer<Int32>

foreign func passCPtrInt64(a: CPointer<Int64>): CPointer<Int64>

foreign func passCPtrUInt8(a: CPointer<UInt8>): CPointer<UInt8>

foreign func passCPtrUInt16(a: CPointer<UInt16>): CPointer<UInt16>

foreign func passCPtrUInt32(a: CPointer<UInt32>): CPointer<UInt32>

foreign func passCPtrUInt64(a: CPointer<UInt64>): CPointer<UInt64>

foreign func passCPtrFloat32(a: CPointer<Float32>): CPointer<Float32>

foreign func passCPtrFloat64(a: CPointer<Float64>): CPointer<Float64>

unsafe main() {
    var iptr: CPointer<Float32> = unsafe { getCPtrInt() }

    if (!iptr.isNotNull()) {
        return 1
    }

    var aa = iptr + 1

    if (aa.read() != 3.5) {
        return 2
    }

    if ((aa + 1).read() != 3.6) {
        return 3
    }

    if ((aa - 1).read() != 3.4) {
        return 4
    }

    var retV = iptr.read()
    if (retV != 3.4) {
        return 5
    }

    if (iptr.read() == iptr.read(1)) {
        return 6
    }

    iptr.write(4.4)

    unsafe { PassCPointerToC(iptr) }

    if (!iptr.isNotNull()) {
        return 7
    }

    if (iptr.read() != 4.4) {
        return 8
    }

    iptr.write(5.5)

    if (iptr.read() != 5.5) {
        return 9
    }

    iptr.write(0, 6.6)
    if (iptr.read() != 6.6) {
        return 10
    }

    if (iptr.read(0) != 6.6) {
        return 11
    }

    iptr.write(1, 6.6)
    if (iptr.read(1) != 6.6) {
        return 12
    }

    if (iptr.read(1) != aa.read()) {
        return 13
    }

    var fromCVoid = unsafe { getCPtrVoid() }
    var fromCBool = unsafe { getCPtrBool() }
    var fromCChar = unsafe { getCPtrChar() }

    var fromCInt8 = unsafe { getCPtrInt8() }
    var fromCInt16 = unsafe { getCPtrInt16() }
    var fromCInt32 = unsafe { getCPtrInt32() }
    var fromCInt64 = unsafe { getCPtrInt64() }

    var fromCUInt8 = unsafe { getCPtrUInt8() }
    var fromCUInt16 = unsafe { getCPtrUInt16() }
    var fromCUInt32 = unsafe { getCPtrUInt32() }
    var fromCUInt64 = unsafe { getCPtrUInt64() }

    var fromCFloat32 = unsafe { getCPtrFloat32() }
    var fromCFloat64 = unsafe { getCPtrFloat64() }

    if (fromCVoid.read() != ()) {
        return 14
    }

    if (fromCBool.read() != true) {
        return 15
    }

    if (fromCChar.read() != Int8(UInt32(r'a'))) {
        return 16
    }

    if (fromCInt8.read() != 127) {
        return 17
    }

    if (fromCInt16.read() != 32767) {
        return 18
    }

    if (fromCInt32.read() != 2147483647) {
        return 19
    }

    if (fromCInt64.read() != 9223372036854775807) {
        return 20
    }

    if (fromCUInt8.read() != 127 * 2 + 1) {
        return 21
    }

    if (fromCUInt16.read() != 32767 * 2 + 1) {
        return 22
    }

    if (fromCUInt32.read() != 2147483647 * 2 + 1) {
        return 23
    }

    if (fromCUInt64.read() != UInt64(9223372036854775807) * 2 + 1) {
        return 24
    }

    if (fromCFloat32.read() != 3.8) {
        return 25
    }

    if (fromCFloat64.read() != 3.8) {
        return 26
    }

    if (unsafe { passCPtrVoid(fromCVoid).read() != fromCVoid.read() }) {
        return 1
    }

    if (unsafe { passCPtrBool(fromCBool).read() != fromCBool.read() }) {
        return 1
    }
    if (unsafe { passCPtrChar(fromCChar).read() != fromCChar.read() }) {
        return 1
    }
    if (unsafe { passCPtrInt8(fromCInt8).read() != fromCInt8.read() }) {
        return 1
    }
    if (unsafe { passCPtrInt16(fromCInt16).read() != fromCInt16.read() }) {
        return 1
    }
    if (unsafe { passCPtrInt32(fromCInt32).read() != fromCInt32.read() }) {
        return 1
    }
    if (unsafe { passCPtrInt64(fromCInt64).read() != fromCInt64.read() }) {
        return 1
    }
    if (unsafe { passCPtrUInt8(fromCUInt8).read() != fromCUInt8.read() }) {
        return 1
    }
    if (unsafe { passCPtrUInt16(fromCUInt16).read() != fromCUInt16.read() }) {
        return 1
    }
    if (unsafe { passCPtrUInt32(fromCUInt32).read() != fromCUInt32.read() }) {
        return 1
    }
    if (unsafe { passCPtrUInt64(fromCUInt64).read() != fromCUInt64.read() }) {
        return 1
    }
    if (unsafe { passCPtrFloat32(fromCFloat32).read() != fromCFloat32.read() }) {
        return 1
    }
    if (unsafe { passCPtrFloat64(fromCFloat64).read() != fromCFloat64.read() }) {
        return 1
    }

    fromCFloat32.write(3.5)

    var res = unsafe { PassCPointerToC(fromCFloat32) }

    if (fromCFloat32.read() != 3.5) {
        return 27
    }

    if (!res) {
        return 28
    }
    FreeAllPointer()
    return 0
}
