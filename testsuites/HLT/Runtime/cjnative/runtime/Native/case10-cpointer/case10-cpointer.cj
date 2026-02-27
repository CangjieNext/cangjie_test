/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.cpp
// (not Windows) EXEC: %clang -c %clang_opt %n.cpp -o lib%n.cpp.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.cpp.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
pass to CJ a: 3.400000
33
44
19980324
1998
19971107
8968
get from CJ a: 4.400000
55
8968
8968
85
58
66
77
pass to CJ void a: 127
pass to CJ bool a: 1
pass to CJ char a: a
pass to CJ int8 a: 127
pass to CJ int16 a: 32767
pass to CJ int32 a: 2147483647
pass to CJ int64 a: 9223372036854775807
pass to CJ uint8 a: 255
pass to CJ uint16 a: 65535
pass to CJ uint32 a: 4294967295
pass to CJ uint64 a: 18446744073709551615
pass to CJ float32 a: 3.800000
pass to CJ float64 a: 3.800000
1
2
3
4
5
6
7
8
9
10
11
12
13
get from CJ void.
get from CJ bool a: 1
get from CJ char a: a
get from CJ int8 a: 127
get from CJ int16 a: 32767
get from CJ int32 a: 2147483647
get from CJ int64 a: 9223372036854775807
get from CJ uint8 a: 255
get from CJ uint16 a: 65535
get from uint32 a: 4294967295
get from CJ uint64 a: 18446744073709551615
get from CJ float32 a: 3.800000
get from CJ float64 a: 3.800000
get from CJ a: 3.500000
88
99
 */

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

main() {
    unsafe{
        var iptr: CPointer<Float32> = unsafe { getCPtrInt() }
        println(33.toString())

        if (iptr.isNotNull()) {
            println(44.toString())
        }

        var aa = iptr + 1

        if (aa.read() == 3.5) {
            println(19980324.toString())
        }

        if ((aa + 1).read() == 3.6) {
            println(1998.toString())
        }

        if ((aa - 1).read() == 3.4) {
            println(19971107.toString())
        }

        var retV = iptr.read()
        if (retV == 3.4) {
            println(8968.toString())
        }

        if (iptr.read() == iptr.read(1)) {
            println(8968.toString())
        }

        iptr.write(4.4)

        unsafe { PassCPointerToC(iptr) }

        if (iptr.isNotNull()) {
            println(55.toString())
        }

        if (iptr.read() == 4.4) {
            println(8968.toString())
        }

        iptr.write(5.5)

        if (iptr.read() == 5.5) {
            println(8968.toString())
        }

        iptr.write(0, 6.6)
        if (iptr.read() == 6.6) {
            println(85.toString())
        }

        if (iptr.read(0) == 6.6) {
            println(58.toString())
        }

        iptr.write(1, 6.6)
        if (iptr.read(1) == 6.6) {
            println(66.toString())
        }

        if (iptr.read(1) == aa.read()) {
            println(77.toString())
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

        if (fromCVoid.read() == ()) {
            println(1.toString())
        }

        if (fromCBool.read() == true) {
            println(2.toString())
        }

        if (fromCChar.read() == Int8(UInt32(r'a'))) {
            println(3.toString())
        }

        if (fromCInt8.read() == 127) {
            println(4.toString())
        }

        if (fromCInt16.read() == 32767) {
            println(5.toString())
        }

        if (fromCInt32.read() == 2147483647) {
            println(6.toString())
        }

        if (fromCInt64.read() == 9223372036854775807) {
            println(7.toString())
        }

        if (fromCUInt8.read() == 127 * 2 + 1) {
            println(8.toString())
        }

        if (fromCUInt16.read() == 32767 * 2 + 1) {
            println(9.toString())
        }

        if (fromCUInt32.read() == 2147483647 * 2 + 1) {
            println(10.toString())
        }

        if (fromCUInt64.read() == UInt64(9223372036854775807) * 2 + 1) {
            println(11.toString())
        }

        if (fromCFloat32.read() == 3.8) {
            println(12.toString())
        }

        if (fromCFloat64.read() == 3.8) {
            println(13.toString())
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

        if (fromCFloat32.read() == 3.5) {
            println(88.toString())
        }

        if (res) {
            println(99.toString())
        }
        FreeAllPointer()
        return 0
    }
}
