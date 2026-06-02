// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: GetPtr.cpp
// EXEC: %clang %clang_shared_opt GetPtr.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan this is from c++.
// ASSERT: scan x : 1 , y : 2 , z : 3, ptr : 5
// ASSERT: regex primary type is right.
// ASSERT: regex ptr type is right.
// ASSERT: regex cast type is right.
// ASSERT: regex cast type2 is right.
// ASSERT: regex cast type3 is right.
// ASSERT: scan free: x : 1 , y : 2 , z : 3
// ASSERT: regex true
// ASSERT: scan from func name call.


foreign func AllocCStruct(): CPointer<BiggerStruct>

foreign func FreeCStruct(x:CPointer<BiggerStruct>): Unit

foreign func `func`(): Unit

@C
struct BiggerStruct {
   public var x: Int32
   public var y: UInt16
   public var z: Int16
   public var ptr: CPointer<Int32>
   public init (x_: Int32, y_: UInt16, z_: Int16, ptr_: CPointer<Int32>) {
      x = x_
      y = y_
      z = z_
      ptr = ptr_
   }
}

@C
struct SmallerStruct {
  public var x1: UInt16
  public var x2: Int16
  public var y1: Int8
  public var y2: UInt8
  public var z1: UInt8
  public var z2: Int8
  public init(x1!: UInt16, x2!: Int16, y1!: Int8, y2!: UInt8, z1!: UInt8, z2!: Int8) {
      this.x1 = x1
      this.x2 = x2
      this.y1 = y1
      this.y2 = y2
      this.z1 = z1
      this.z2 = z2
  }
}

@C
struct SmallerStruct2 {
  public var x: Int16
  public var x2: Int16
  public var y: UInt16
  public var z: UInt8
  public var z2: Int8
  public init(x!: Int16, x2!: Int16, y!: UInt16, z!: UInt8, z2!: Int8) {
      this.x = x
      this.x2 = x2
      this.y = y
      this.z = z
      this.z2 = z2
  }
}

@C
struct SmallerStruct3 {
  public var x: UInt32
  public var y1: Int8
  public var y2: Int8
  public var z: UInt16
  public init(x!: UInt32, y1!: Int8, y2!: Int8, z!: UInt16) {
      this.x = x
      this.y1 = y1
      this.y2 = y2
      this.z = z
  }
}

unsafe main() {
    var b : CPointer<BiggerStruct> = AllocCStruct()
    let bigger = b.read()
    print(b.toUIntNative().toString())
    if (bigger.x == 1 && bigger.y == 2 && bigger.z == 3) {
        print("primary type is right.\n")
    }

    if (bigger.ptr.read() == 5) {
        print("ptr type is right.\n")
    }

    var s : CPointer<SmallerStruct> = CPointer<SmallerStruct>(b)
    let smaller = s.read()
    print(s.toUIntNative().toString())
    var condition1 = smaller.x1 == 1 && smaller.y1 == 2 && smaller.z1 == 3
    var condition2 = smaller.x2 == 0 && smaller.y2 == 0 && smaller.z2 == 0
    if (condition1 && condition2) {
        print("cast type is right.\n")
    }

    var s2 : CPointer<SmallerStruct2> = CPointer<SmallerStruct2>(b)
    let smaller2 = s2.read()
    var condition = smaller2.x == 1 && smaller2.x2 == 0 && smaller2.y == 2 && smaller2.z == 3 && smaller2.z2 == 0
    if (condition) {
        print("cast type2 is right.\n")
    }

    var s3 : CPointer<SmallerStruct3> = CPointer<SmallerStruct3>(b)
    let smaller3 = s3.read()
    var condition3 = smaller3.x == 1 && smaller3.y1 == 2 && smaller3.y2 == 0 && smaller3.z == 3
    if (condition3) {
        print("cast type3 is right.\n")
    }

    FreeCStruct(b)

    var emptr: CPointer<Int32> = CPointer<Int32>()
    print(emptr.isNull().toString())

    `func`()

    return 0
}
