/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_04_a02_01

  @Level:         1

  @Assertion:    13.1.4(2) So all types supported in C Interoperation can be
                 used as subtypes of the CType interface.

  @Description:  Check types implementing CType.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      Tests for the assertion a01 apply to this assertion as well.

*/

class CTypeChecker<T> where T <: CType {}

main() {
    let ValUnit    = CTypeChecker<Unit   >()
    let ValBool    = CTypeChecker<Bool   >()
    let ValInt8    = CTypeChecker<Int8   >()
    let ValUInt8   = CTypeChecker<UInt8  >()
    let ValInt16   = CTypeChecker<Int16  >()
    let ValUInt16  = CTypeChecker<UInt16 >()
    let ValInt32   = CTypeChecker<Int32  >()
    let ValUInt32  = CTypeChecker<UInt32 >()
    let ValInt64   = CTypeChecker<Int64  >()
    let ValUInt64  = CTypeChecker<UInt64 >()
    let ValFloat32 = CTypeChecker<Float32>()
    let ValFloat64 = CTypeChecker<Float64>()
    let ValPtrUnit    = CTypeChecker<CPointer<Unit   >>()
    let ValPtrBool    = CTypeChecker<CPointer<Bool   >>()
    let ValPtrInt8    = CTypeChecker<CPointer<Int8   >>()
    let ValPtrUInt8   = CTypeChecker<CPointer<UInt8  >>()
    let ValPtrInt16   = CTypeChecker<CPointer<Int16  >>()
    let ValPtrUInt16  = CTypeChecker<CPointer<UInt16 >>()
    let ValPtrInt32   = CTypeChecker<CPointer<Int32  >>()
    let ValPtrUInt32  = CTypeChecker<CPointer<UInt32 >>()
    let ValPtrInt64   = CTypeChecker<CPointer<Int64  >>()
    let ValPtrUInt64  = CTypeChecker<CPointer<UInt64 >>()
    let ValPtrFloat32 = CTypeChecker<CPointer<Float32>>()
    let ValPtrFloat64 = CTypeChecker<CPointer<Float64>>()
    let ValPtrPtrUnit    = CTypeChecker<CPointer<CPointer<Unit   >>>()
    let ValPtrPtrBool    = CTypeChecker<CPointer<CPointer<Bool   >>>()
    let ValPtrPtrInt8    = CTypeChecker<CPointer<CPointer<Int8   >>>()
    let ValPtrPtrUInt8   = CTypeChecker<CPointer<CPointer<UInt8  >>>()
    let ValPtrPtrInt16   = CTypeChecker<CPointer<CPointer<Int16  >>>()
    let ValPtrPtrUInt16  = CTypeChecker<CPointer<CPointer<UInt16 >>>()
    let ValPtrPtrInt32   = CTypeChecker<CPointer<CPointer<Int32  >>>()
    let ValPtrPtrUInt32  = CTypeChecker<CPointer<CPointer<UInt32 >>>()
    let ValPtrPtrInt64   = CTypeChecker<CPointer<CPointer<Int64  >>>()
    let ValPtrPtrUInt64  = CTypeChecker<CPointer<CPointer<UInt64 >>>()
    let ValPtrPtrFloat32 = CTypeChecker<CPointer<CPointer<Float32>>>()
    let ValPtrPtrFloat64 = CTypeChecker<CPointer<CPointer<Float64>>>()

    let ValCString = CTypeChecker<CString>()
    let ValCFunc   = CTypeChecker<CFunc<()->Unit>>()
}