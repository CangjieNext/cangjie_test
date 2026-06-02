
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a03_01

  @Level:         1

  @Assertion: 4.1(3) Literal examples:

    main(): Int64 {
        10u8 // UInt8 literal
        10i16 // Int16 literal
        1024u32 // UInt32 literal
        1024 // Int64 literal
        1024.512_f32 // Float32 literal
        1024.512 // Float64 literal
        r'a' // Rune literal
        b'a' // Character byte literal, it has UInt8 type
        true // Bool literal
        "Cangjie" // String literal
        b"Cangjie" // Byte string array literal, it has Array<UInt8> type
        () // Unit literal
        [1, 2, 3] // Array<Int64> literal
        (1, 2, 3) // (Int64, Int64, Int64) literal
        return 0
    }

  @Description: Checks the example from the Spec.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main(): Int64 {
    Assert.isTrue(10u8 is UInt8)                // UInt8 literal
    Assert.isTrue(10i16 is Int16)               // Int16 literal
    Assert.isTrue(1024u32 is UInt32)            // UInt32 literal
    Assert.isTrue(1024 is Int64)                // Int64 literal
    Assert.isTrue(1024.512_f32 is Float32)      // Float32 literal
    Assert.isTrue(1024.512 is Float64)          // Float64 literal
    Assert.isTrue(r'a' is Rune)                  // Rune literal
    Assert.isTrue(b'a' is UInt8)                // Character byte literal, it has UInt8 type
    Assert.isTrue(true is Bool)                 // Bool literal
    Assert.isTrue("Cangjie" is String)          // String literal
    Assert.isTrue(() is Unit)                   // Unit literal
    Assert.isTrue([1, 2, 3] is Array<Int64>)    // Array<Int64> literal
    Assert.isTrue((1, 2, 3) is (Int64, Int64, Int64))  // (Int64, Int64, Int64) literal
    return 0
}
