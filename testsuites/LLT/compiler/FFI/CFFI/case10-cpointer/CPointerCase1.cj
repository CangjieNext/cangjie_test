// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// The HLT has the same one. The test cases are not executed here. However, keep it for design guidance.
//// DEPENDENCE: GetPtr.cpp
//// EXEC: %clang %clang_shared_opt GetPtr.cpp -o %cffi_output
//// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
//// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan pass to CJ a: 3.400000
// ASSERT: regex 3344
// ASSERT: regex 19980324199819971107
// ASSERT: scan 8968
// ASSERT: scan get from CJ a: 4.400000
// ASSERT: regex 558968
// ASSERT: regex 896885586677
// ASSERT: scan pass to CJ bool a: 1
// ASSERT: scan pass to CJ char a: a
// ASSERT: scan pass to CJ int8 a: 127
// ASSERT: scan pass to CJ int16 a: 32767
// ASSERT: scan pass to CJ int32 a: 2147483647
// ASSERT: scan pass to CJ int64 a: 9223372036854775807
// ASSERT: scan pass to CJ uint8 a: 255
// ASSERT: scan pass to CJ uint16 a: 65535
// ASSERT: scan pass to CJ uint32 a: 4294967295
// ASSERT: scan pass to CJ uint64 a: 18446744073709551615
// ASSERT: scan pass to CJ float32 a: 3.800000
// ASSERT: scan pass to CJ float64 a: 3.800000
// ASSERT: regex 12345678910111213
// ASSERT: scan get from CJ void.
// ASSERT: scan get from CJ bool a: 1
// ASSERT: scan get from CJ char a: a
// ASSERT: scan get from CJ int8 a: 127
// ASSERT: scan get from CJ int16 a: 32767
// ASSERT: scan get from CJ int32 a: 2147483647
// ASSERT: scan get from CJ int64 a: 9223372036854775807
// ASSERT: scan get from CJ uint8 a: 255
// ASSERT: scan get from CJ uint16 a: 65535
// ASSERT: scan get from uint32 a: 4294967295
// ASSERT: scan get from CJ uint64 a: 18446744073709551615
// ASSERT: scan get from CJ float32 a: 3.800000
// ASSERT: scan get from CJ float64 a: 3.800000
// ASSERT: scan get from CJ a: 3.500000
// ASSERT: regex 8899



foreign func PassCPointerToC(a: CPointer<Float32>): Bool
foreign func FreeAllPointer():Unit
foreign func getCPtrInt(): CPointer<Float32>

foreign func getCPtrVoid(): CPointer<Unit>
foreign func getCPtrBool(): CPointer<Bool>
foreign func getCPtrRune(): CPointer<Rune>
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
foreign func passCPtrRune(a: CPointer<Rune>): CPointer<Rune>
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
    var iptr:CPointer<Float32> = unsafe{ getCPtrInt() }
    print(33.toString())

    if (iptr.isNotNull()) {
        print(44.toString())
    }

    print(iptr.toUIntNative().toString())
    var aa = iptr + 1
    print(aa.toUIntNative().toString())

    if (aa.read() == 3.5) {
        print(19980324.toString())
    }

    if ((aa + 1).read() == 3.6) {
        print(1998.toString())
    }

    if ((aa - 1).read() == 3.4) {
        print(19971107.toString())
    }

    var retV = iptr.read()
    if (retV == 3.4) {
        print(8968.toString())
    }

    if (iptr.read() == iptr.read(1)) {
        print(8968.toString())
    }

    iptr.write(4.4)

    unsafe{ PassCPointerToC(iptr) }

    print(iptr.toUIntNative().toString())

    if (iptr.isNotNull()) {
        print(55.toString())
    }

    if (iptr.read() == 4.4) {
        print(8968.toString())
    }

    print(iptr.toUIntNative().toString())
    iptr.write(5.5)

    if (iptr.read() == 5.5) {
        print(8968.toString())
    }

    iptr.write(0, 6.6)
    if (iptr.read() == 6.6) {
        print(85.toString())
    }

    if (iptr.read(0) == 6.6) {
        print(58.toString())
    }

    iptr.write(1, 6.6)
    if (iptr.read(1) == 6.6) {
        print(66.toString())
    }

    if (iptr.read(1) == aa.read()) {
        print(77.toString())
    }

    var fromCVoid = unsafe{ getCPtrVoid() }
    var fromCBool = unsafe{ getCPtrBool() }
    var fromCRune = unsafe{ getCPtrRune() }

    var fromCInt8 = unsafe{ getCPtrInt8() }
    var fromCInt16 = unsafe{ getCPtrInt16() }
    var fromCInt32 = unsafe{ getCPtrInt32() }
    var fromCInt64 = unsafe{ getCPtrInt64() }

    var fromCUInt8 = unsafe{ getCPtrUInt8() }
    var fromCUInt16 = unsafe{ getCPtrUInt16() }
    var fromCUInt32 = unsafe{ getCPtrUInt32() }
    var fromCUInt64 = unsafe{ getCPtrUInt64() }

    var fromCFloat32 = unsafe{ getCPtrFloat32() }
    var fromCFloat64 = unsafe{ getCPtrFloat64() }

    if (fromCVoid.read() == ()) {
        print(1.toString())
    }

    if (fromCBool.read() == true) {
        print(2.toString())
    }

    if (fromCRune.read() == 'a') {
        print(3.toString())
    }

    if (fromCInt8.read() == 127) {
        print(4.toString())
    }

    if (fromCInt16.read() == 32767) {
        print(5.toString())
    }

    if (fromCInt32.read() == 2147483647) {
        print(6.toString())
    }

    if (fromCInt64.read() == 9223372036854775807) {
        print(7.toString())
    }

    if (fromCUInt8.read() == 127 * 2 + 1) {
        print(8.toString())
    }

    if (fromCUInt16.read() == 32767 * 2 + 1) {
        print(9.toString())
    }

    if (fromCUInt32.read() == 2147483647 * 2 + 1) {
        print(10.toString())
    }

    if (fromCUInt64.read() == UInt64(9223372036854775807) * 2 + 1) {
        print(11.toString())
    }

    if (fromCFloat32.read() == 3.8) {
        print(12.toString())
    }

    if (fromCFloat64.read() == 3.8) {
        print(13.toString())
    }


    if (unsafe{ passCPtrVoid(fromCVoid).read() !=  fromCVoid.read() }) {
        return 1
    }

    if (unsafe{ passCPtrBool(fromCBool).read() !=  fromCBool.read() }) {
        return 1
    }
    if (unsafe{ passCPtrRune(fromCRune).read() !=  fromCRune.read() }) {
        return 1
    }
    if (unsafe{ passCPtrInt8(fromCInt8).read() !=  fromCInt8.read() }) {
        return 1
    }
    if (unsafe{ passCPtrInt16(fromCInt16).read() !=  fromCInt16.read() }) {
        return 1
    }
    if (unsafe{ passCPtrInt32(fromCInt32).read() !=  fromCInt32.read() }) {
        return 1
    }
    if (unsafe{ passCPtrInt64(fromCInt64).read() !=  fromCInt64.read() }) {
        return 1
    }
    if (unsafe{ passCPtrUInt8(fromCUInt8).read() !=  fromCUInt8.read() }) {
        return 1
    }
    if (unsafe{ passCPtrUInt16(fromCUInt16).read() !=  fromCUInt16.read() }) {
        return 1
    }
    if (unsafe{ passCPtrUInt32(fromCUInt32).read() !=  fromCUInt32.read() }) {
        return 1
    }
    if (unsafe{ passCPtrUInt64(fromCUInt64).read() !=  fromCUInt64.read() }) {
        return 1
    }
    if (unsafe{ passCPtrFloat32(fromCFloat32).read() !=  fromCFloat32.read() }) {
        return 1
    }
    if (unsafe{ passCPtrFloat64(fromCFloat64).read() !=  fromCFloat64.read() }) {
        return 1
    }

    fromCFloat32.write(3.5)

    var res = unsafe{ PassCPointerToC(fromCFloat32) }

    if (fromCFloat32.read() == 3.5) {
        print(88.toString())
    }

    if (res) {
        print(99.toString())
    }
  FreeAllPointer()
  return 0
}
