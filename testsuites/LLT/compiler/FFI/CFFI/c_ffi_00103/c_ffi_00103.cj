// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

@C
struct BiggerStruct {
   public var x: Int64
   public var y: Int64
   public var z: Int64
   public init (x: Int64, y: Int64, z : Int64) {
       this.x = x
       this.y = y
       this.z = z
   }
}

@C
struct AnotherStruct {
   public var x1: Int32
   public var x2: Int32
   public var y1: Int32
   public var y2: Int32
   public var z1: Int32
   public var z2: Int32
    public init(x1!: Int32, x2!: Int32, y1!: Int32, y2!: Int32, z1!: Int32, z2!: Int32) {
        this.x1 = x1
        this.x2 = x2
        this.y1 = y1
        this.y2 = y2
        this.z1 = z1
        this.z2 = z2
    }
}

foreign func AllocCStruct(): CPointer<CPointer<BiggerStruct>>
foreign func FreeCStruct(x:CPointer<BiggerStruct>): Unit
foreign func GetFirstLevel(x:CPointer<CPointer<BiggerStruct>>) : CPointer<BiggerStruct>
foreign func printf(fmt: CString, ...) : Int32

main():Int64 {
  let s = BiggerStruct(10, 20, 30)
  var p = unsafe { GetFirstLevel(AllocCStruct()) }
  unsafe { p.write(0, s) }
  let local: BiggerStruct = unsafe { p.read(0) }
  let typeCast : CPointer<AnotherStruct> = CPointer<AnotherStruct>(p)
  let another = unsafe { typeCast.read(0) }

  var outputFormat = unsafe {LibC.mallocCString("%d %d %d %d %d %d\n")}
  unsafe { printf(outputFormat, another.x1, another.x2, another.y1, another.y2, another.z1, another.z2) }
  unsafe { LibC.free(outputFormat) }

  unsafe { FreeCStruct(p) }

  var outputFormat2 = unsafe {LibC.mallocCString("%d %d %d")}
  unsafe { printf(outputFormat2, local.x, local.y, local.z) }
  unsafe { LibC.free(outputFormat2) }

  if (local.x == 10 && local.y == 20 && local.z == 30 && another.x1 == 10 && another.x2 == 0 && another.y1 == 20 && another.y2 == 0 && another.z1 == 30 && another.z2 == 0) {
    return 0
  }
  return 1
}
