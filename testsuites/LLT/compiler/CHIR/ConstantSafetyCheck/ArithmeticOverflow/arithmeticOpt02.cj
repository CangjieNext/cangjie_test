// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let INT8_MIN: Int8 = -128
let INT8_MAX: Int8 = 127
let UINT8_MAX: UInt8 = 255
let INT16_MIN: Int16 = -32768 
let INT16_MAX: Int16 = 32767
let UINT16_MAX: UInt16 = 65535
let INT32_MIN: Int32 = -2147483648
let INT32_MAX: Int32 = 2147483647
let UINT32_MAX: UInt32 = 4294967295
let INT64_MIN: Int64 = -9223372036854775808
let INT64_MAX: Int64 = 9223372036854775807
let UINT64_MAX: UInt64 = 18446744073709551615

public func arithmeticOpt01() {
    var a1: Int8 = INT8_MAX * 10
    var a2: Int8 = INT8_MIN / (-1)

    var a3: Int16 = INT16_MAX * 10
    var a4: Int16 = INT16_MIN / (-1)

    var a5: Int32 = INT32_MAX * 10
    var a6: Int32 = INT32_MIN / (-1)

    var a7: Int64 = INT64_MAX * 10
    var a8: Int64 = INT64_MIN / (-1)
}

main() {
    arithmeticOpt01()
    0
}

/* SCAN
warning: unused variable:'a1'
  ==> arithmeticOpt02.cj:18:9:
   | 
18 |     var a1: Int8 = INT8_MAX * 10
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '*' overflow
  ==> arithmeticOpt02.cj:18:20:
   | 
18 |     var a1: Int8 = INT8_MAX * 10
   |                    ^^^^^^^^^^^^^ operation 'Int8(127) * Int8(10)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

warning: unused variable:'a2'
  ==> arithmeticOpt02.cj:19:9:
   | 
19 |     var a2: Int8 = INT8_MIN / (-1)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '/' overflow
  ==> arithmeticOpt02.cj:19:20:
   | 
19 |     var a2: Int8 = INT8_MIN / (-1)
   |                    ^^^^^^^^^^^^^^^ operation 'Int8(-128) / Int8(-1)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

warning: unused variable:'a3'
  ==> arithmeticOpt02.cj:21:9:
   | 
21 |     var a3: Int16 = INT16_MAX * 10
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '*' overflow
  ==> arithmeticOpt02.cj:21:21:
   | 
21 |     var a3: Int16 = INT16_MAX * 10
   |                     ^^^^^^^^^^^^^^ operation 'Int16(32767) * Int16(10)' would overflow
   | 
   # note: range of Int16 is -32768 ~ 32767

warning: unused variable:'a4'
  ==> arithmeticOpt02.cj:22:9:
   | 
22 |     var a4: Int16 = INT16_MIN / (-1)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '/' overflow
  ==> arithmeticOpt02.cj:22:21:
   | 
22 |     var a4: Int16 = INT16_MIN / (-1)
   |                     ^^^^^^^^^^^^^^^^ operation 'Int16(-32768) / Int16(-1)' would overflow
   | 
   # note: range of Int16 is -32768 ~ 32767

warning: unused variable:'a5'
  ==> arithmeticOpt02.cj:24:9:
   | 
24 |     var a5: Int32 = INT32_MAX * 10
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '*' overflow
  ==> arithmeticOpt02.cj:24:21:
   | 
24 |     var a5: Int32 = INT32_MAX * 10
   |                     ^^^^^^^^^^^^^^ operation 'Int32(2147483647) * Int32(10)' would overflow
   | 
   # note: range of Int32 is -2147483648 ~ 2147483647

warning: unused variable:'a6'
  ==> arithmeticOpt02.cj:25:9:
   | 
25 |     var a6: Int32 = INT32_MIN / (-1)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '/' overflow
  ==> arithmeticOpt02.cj:25:21:
   | 
25 |     var a6: Int32 = INT32_MIN / (-1)
   |                     ^^^^^^^^^^^^^^^^ operation 'Int32(-2147483648) / Int32(-1)' would overflow
   | 
   # note: range of Int32 is -2147483648 ~ 2147483647

warning: unused variable:'a7'
  ==> arithmeticOpt02.cj:27:9:
   | 
27 |     var a7: Int64 = INT64_MAX * 10
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '*' overflow
  ==> arithmeticOpt02.cj:27:21:
   | 
27 |     var a7: Int64 = INT64_MAX * 10
   |                     ^^^^^^^^^^^^^^ operation 'Int64(9223372036854775807) * Int64(10)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

warning: unused variable:'a8'
  ==> arithmeticOpt02.cj:28:9:
   | 
28 |     var a8: Int64 = INT64_MIN / (-1)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '/' overflow
  ==> arithmeticOpt02.cj:28:21:
   | 
28 |     var a8: Int64 = INT64_MIN / (-1)
   |                     ^^^^^^^^^^^^^^^^ operation 'Int64(-9223372036854775808) / Int64(-1)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

8 errors generated, 8 errors printed.
8 warnings generated, 8 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
