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
    var a1: Int8 = INT8_MAX + 1
    var a2: Int8 = INT8_MIN - 1
    var a3: UInt8 = UINT8_MAX + 1

    var a4: Int16 = INT16_MAX + 1
    var a5: Int16 = INT16_MIN - 1
    var a6: UInt16 = UINT16_MAX + 1

    var a7: Int32 = INT32_MAX + 1
    var a8: Int32 = INT32_MIN - 1
    var a9: UInt32 = UINT32_MAX + 1

    var a10: Int64 = INT64_MAX + 1
    var a11: Int64 = INT64_MIN - 1
    var a12: UInt64 = UINT64_MAX + 1
}

public func arithmeticOpt02() {
    var a1: Int8 = -INT8_MIN
    var a2: Int16 = -INT16_MIN
    var a3: Int32 = -INT32_MIN
    var a4: Int64 = -INT64_MIN
}

main() {}

/* SCAN
warning: unused variable:'a1'
  ==> arithmeticOpt01.cj:18:9:
   | 
18 |     var a1: Int8 = INT8_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:18:20:
   | 
18 |     var a1: Int8 = INT8_MAX + 1
   |                    ^^^^^^^^^^^^ operation 'Int8(127) + Int8(1)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

warning: unused variable:'a2'
  ==> arithmeticOpt01.cj:19:9:
   | 
19 |     var a2: Int8 = INT8_MIN - 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:19:20:
   | 
19 |     var a2: Int8 = INT8_MIN - 1
   |                    ^^^^^^^^^^^^ operation 'Int8(-128) - Int8(1)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

warning: unused variable:'a3'
  ==> arithmeticOpt01.cj:20:9:
   | 
20 |     var a3: UInt8 = UINT8_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:20:21:
   | 
20 |     var a3: UInt8 = UINT8_MAX + 1
   |                     ^^^^^^^^^^^^^ operation 'UInt8(255) + UInt8(1)' would overflow
   | 
   # note: range of UInt8 is 0 ~ 255

warning: unused variable:'a4'
  ==> arithmeticOpt01.cj:22:9:
   | 
22 |     var a4: Int16 = INT16_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:22:21:
   | 
22 |     var a4: Int16 = INT16_MAX + 1
   |                     ^^^^^^^^^^^^^ operation 'Int16(32767) + Int16(1)' would overflow
   | 
   # note: range of Int16 is -32768 ~ 32767

warning: unused variable:'a5'
  ==> arithmeticOpt01.cj:23:9:
   | 
23 |     var a5: Int16 = INT16_MIN - 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:23:21:
   | 
23 |     var a5: Int16 = INT16_MIN - 1
   |                     ^^^^^^^^^^^^^ operation 'Int16(-32768) - Int16(1)' would overflow
   | 
   # note: range of Int16 is -32768 ~ 32767

warning: unused variable:'a6'
  ==> arithmeticOpt01.cj:24:9:
   | 
24 |     var a6: UInt16 = UINT16_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:24:22:
   | 
24 |     var a6: UInt16 = UINT16_MAX + 1
   |                      ^^^^^^^^^^^^^^ operation 'UInt16(65535) + UInt16(1)' would overflow
   | 
   # note: range of UInt16 is 0 ~ 65535

warning: unused variable:'a7'
  ==> arithmeticOpt01.cj:26:9:
   | 
26 |     var a7: Int32 = INT32_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:26:21:
   | 
26 |     var a7: Int32 = INT32_MAX + 1
   |                     ^^^^^^^^^^^^^ operation 'Int32(2147483647) + Int32(1)' would overflow
   | 
   # note: range of Int32 is -2147483648 ~ 2147483647

warning: unused variable:'a8'
  ==> arithmeticOpt01.cj:27:9:
   | 
27 |     var a8: Int32 = INT32_MIN - 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:27:21:
   | 
27 |     var a8: Int32 = INT32_MIN - 1
   |                     ^^^^^^^^^^^^^ operation 'Int32(-2147483648) - Int32(1)' would overflow
   | 
   # note: range of Int32 is -2147483648 ~ 2147483647

warning: unused variable:'a9'
  ==> arithmeticOpt01.cj:28:9:
   | 
28 |     var a9: UInt32 = UINT32_MAX + 1
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:28:22:
   | 
28 |     var a9: UInt32 = UINT32_MAX + 1
   |                      ^^^^^^^^^^^^^^ operation 'UInt32(4294967295) + UInt32(1)' would overflow
   | 
   # note: range of UInt32 is 0 ~ 4294967295

warning: unused variable:'a10'
  ==> arithmeticOpt01.cj:30:9:
   | 
30 |     var a10: Int64 = INT64_MAX + 1
   |         ^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:30:22:
   | 
30 |     var a10: Int64 = INT64_MAX + 1
   |                      ^^^^^^^^^^^^^ operation 'Int64(9223372036854775807) + Int64(1)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

warning: unused variable:'a11'
  ==> arithmeticOpt01.cj:31:9:
   | 
31 |     var a11: Int64 = INT64_MIN - 1
   |         ^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:31:22:
   | 
31 |     var a11: Int64 = INT64_MIN - 1
   |                      ^^^^^^^^^^^^^ operation 'Int64(-9223372036854775808) - Int64(1)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

warning: unused variable:'a12'
  ==> arithmeticOpt01.cj:32:9:
   | 
32 |     var a12: UInt64 = UINT64_MAX + 1
   |         ^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '+' overflow
  ==> arithmeticOpt01.cj:32:23:
   | 
32 |     var a12: UInt64 = UINT64_MAX + 1
   |                       ^^^^^^^^^^^^^^ operation 'UInt64(18446744073709551615) + UInt64(1)' would overflow
   | 
   # note: range of UInt64 is 0 ~ 18446744073709551615

warning: unused variable:'a1'
  ==> arithmeticOpt01.cj:36:9:
   | 
36 |     var a1: Int8 = -INT8_MIN
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:36:20:
   | 
36 |     var a1: Int8 = -INT8_MIN
   |                    ^^^^^^^^^ operation '-Int8(-128)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

warning: unused variable:'a2'
  ==> arithmeticOpt01.cj:37:9:
   | 
37 |     var a2: Int16 = -INT16_MIN
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:37:21:
   | 
37 |     var a2: Int16 = -INT16_MIN
   |                     ^^^^^^^^^^ operation '-Int16(-32768)' would overflow
   | 
   # note: range of Int16 is -32768 ~ 32767

warning: unused variable:'a3'
  ==> arithmeticOpt01.cj:38:9:
   | 
38 |     var a3: Int32 = -INT32_MIN
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:38:21:
   | 
38 |     var a3: Int32 = -INT32_MIN
   |                     ^^^^^^^^^^ operation '-Int32(-2147483648)' would overflow
   | 
   # note: range of Int32 is -2147483648 ~ 2147483647

warning: unused variable:'a4'
  ==> arithmeticOpt01.cj:39:9:
   | 
39 |     var a4: Int64 = -INT64_MIN
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: arithmetic operation '-' overflow
  ==> arithmeticOpt01.cj:39:21:
   | 
39 |     var a4: Int64 = -INT64_MIN
   |                     ^^^^^^^^^^ operation '-Int64(-9223372036854775808)' would overflow
   | 
   # note: range of Int64 is -9223372036854775808 ~ 9223372036854775807

16 errors generated, 16 errors printed.
16 warnings generated, 16 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
