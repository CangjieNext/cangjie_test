// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan get from CJ struct: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan change CJ struct: x -> 5 , y -> 6 , z -> 7
// ASSERT: regex 345
// ASSERT: regex 567
// ASSERT: scan get int a -> 8 , b -> 9 , c -> 10
// ASSERT: scan get from CJ struct1: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan get from CJ struct2: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan get from CJ struct3: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan get int a -> 10 , b -> 9 , c -> 8
// ASSERT: scan get from CJ struct1: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan get from CJ struct2: x -> 3 , y -> 4 , z -> 5
// ASSERT: scan get from CJ struct3: x -> 3 , y -> 4 , z -> 5

// ASSERT: scan get from CJ struct1: x -> 8 , y -> 8 , z -> 8
// ASSERT: scan get from CJ struct2: x -> 8 , y -> 8 , z -> 8
// ASSERT: scan get from CJ struct3: x -> 8 , y -> 8 , z -> 8
// ASSERT: regex 888
// ASSERT: scan get from CJ struct1: x -> 9 , y -> 9 , z -> 9
// ASSERT: scan get from CJ struct2: x -> 9 , y -> 9 , z -> 9
// ASSERT: scan get from CJ struct3: x -> 9 , y -> 9 , z -> 9
// ASSERT: regex pass struct to CJ : x -> 5 , y -> 6 , z -> 7
// ASSERT: regex 567
// ASSERT: scan get int 8
// ASSERT: scan get from CJ struct: a -> 8
// ASSERT: scan change CJ struct: a -> 5
// ASSERT: scan Get not RVO struct : 5
// ASSERT: scan Get smaller from 3 smaller input : 8
// ASSERT: scan Get smaller from 3 bigger input : 1
// ASSERT: scan Get bigger from 3 smaller input : 3

// ASSERT: scan-not judge is error!


foreign func PassStructToCS(aStruct: SmallerStruct): SmallerStruct

foreign func PassStructToCS_Int8(aStruct: SmallerStruct): Int8

foreign func PassStructToCS_Unit(aStruct: SmallerStruct): Unit

foreign func PassStructToCS2(p: SmallerStruct, a: Int32, p2: SmallerStruct, b: Int32, p3: SmallerStruct, c: Int32): SmallerStruct

foreign func PassStructToC(aStruct: BiggerStruct): BiggerStruct

foreign func PassStructToC_Int8(aStruct: BiggerStruct): Int8

foreign func PassStructToC_Unit(aStruct: BiggerStruct): Unit

foreign func PassStructToC2(p: BiggerStruct, a: Int32, p2: BiggerStruct, b: Int32, p3: BiggerStruct, c: Int32): BiggerStruct

foreign func PassStructToC22(a: Int32, p: BiggerStruct, b: Int32, p2: BiggerStruct, c: Int32, p3: BiggerStruct): BiggerStruct

foreign func PassStructToC3(p: BiggerStruct, p2: BiggerStruct, p3: BiggerStruct): BiggerStruct

foreign func PassStructToC4(p: BiggerStruct, p2: BiggerStruct, p3: BiggerStruct): Unit

foreign func PassStructToCSS2(p: BiggerStruct, a: Int32, p2: BiggerStruct, b: Int32, p3: BiggerStruct, c: Int32): SmallerStruct

foreign func PassStructToCC2(p: SmallerStruct, a: Int32, p2: SmallerStruct, b: Int32, p3: SmallerStruct, c: Int32): BiggerStruct


foreign func PassStructToCangjie(): BiggerStruct

foreign func PassStructToCangjie2(a: Int32): BiggerStruct

@C
struct BiggerStruct {
   public var x: Int64
   public var y: Int64
   public var z: Int64
   public init (x_: Int64, y_: Int64, z_: Int64) {
      x = x_
      y = y_
      z = z_
   }
}

@C
struct SmallerStruct {
   public var a: Int32
   public init (a_: Int32) {
     a = a_
  }
}

unsafe main() {
    var aaa : BiggerStruct = BiggerStruct(3, 4, 5)
    var bbb : BiggerStruct = PassStructToC(aaa)
    print(aaa.x.toString())
    print(aaa.y.toString())
    print(aaa.z.toString())

    print(bbb.x.toString())
    print(bbb.y.toString())
    print(bbb.z.toString())

    var bbb1 : BiggerStruct = PassStructToC2(aaa, 8, aaa, 9, aaa, 10)
    var bbb2 : BiggerStruct = PassStructToC22(10, aaa, 9, aaa, 8, aaa)

    var a : BiggerStruct = BiggerStruct(8, 8, 8)
    var b : BiggerStruct = PassStructToC3(a, a, a)
    print(b.x.toString())
    print(b.y.toString())
    print(b.z.toString())

    var c : BiggerStruct = BiggerStruct(9, 9, 9)
    PassStructToC4(c, c, c)

    var ccc : BiggerStruct = PassStructToCangjie()
    print(ccc.x.toString())
    print(ccc.y.toString())
    print(ccc.z.toString())

    var ddd : BiggerStruct = PassStructToCangjie2(8)
    print(ddd.x.toString())
    print(ddd.y.toString())
    print(ddd.z.toString())

    var sss : SmallerStruct = SmallerStruct(8)
    var rss : SmallerStruct = PassStructToCS(sss)
    print("Get not RVO struct : ")
    print(rss.a.toString())

    var rss1 : SmallerStruct = PassStructToCS2(sss, 8, sss, 9, sss, 10)
    print("Get smaller from 3 smaller input : ")
    print(rss1.a.toString())

    var rss11 : SmallerStruct = PassStructToCSS2(ddd, 8, ddd, 9, ddd, 10)
    print("Get smaller from 3 bigger input : ")
    print(rss11.a.toString())

    var res_S_Int8 = PassStructToCS_Int8(rss11)
    var res_B_Int8 = PassStructToC_Int8(a)
    PassStructToCS_Unit(rss11)
    PassStructToC_Unit(a)
    if (res_S_Int8 != 8 || res_B_Int8 != 58) {
        print("judge is error!\n")
    }

    var rss111 : BiggerStruct = PassStructToCC2(sss, 8, sss, 9, sss, 10)
    print("Get bigger from 3 smaller input : ")
    print((rss111.x + rss111.y + rss111.z).toString())

    return 0
}
