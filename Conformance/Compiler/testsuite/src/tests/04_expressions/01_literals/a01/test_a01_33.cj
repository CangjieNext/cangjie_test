
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_33

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that char literals have proper type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isFalse(r'a' is Int8)
    Assert.isFalse(r'a' is Int16)
    Assert.isFalse(r'a' is Int32)
    Assert.isFalse(r'a' is Int64)
    Assert.isFalse(r'a' is UInt8)
    Assert.isFalse(r'a' is UInt16)
    Assert.isFalse(r'a' is UInt32)
    Assert.isFalse(r'a' is UInt64)
    Assert.isFalse(r'a' is Float16)
    Assert.isFalse(r'a' is Float32)
    Assert.isFalse(r'a' is Float64)
    Assert.isTrue(r'a' is Rune)
    Assert.isFalse(r'a' is String)
    Assert.isFalse(r'a' is Array<Int64>)
    Assert.isFalse(r'a' is Unit)
    Assert.isFalse(r'a' is () -> Unit)
    Assert.isFalse(r'a' is C)

    Assert.isFalse(r'n' is Int8)
    Assert.isFalse(r'n' is Int16)
    Assert.isFalse(r'n' is Int32)
    Assert.isFalse(r'n' is Int64)
    Assert.isFalse(r'n' is UInt8)
    Assert.isFalse(r'n' is UInt16)
    Assert.isFalse(r'n' is UInt32)
    Assert.isFalse(r'n' is UInt64)
    Assert.isFalse(r'n' is Float16)
    Assert.isFalse(r'n' is Float32)
    Assert.isFalse(r'n' is Float64)
    Assert.isTrue(r'n' is Rune)
    Assert.isFalse(r'n' is String)
    Assert.isFalse(r'n' is Array<Int64>)
    Assert.isFalse(r'n' is Unit)
    Assert.isFalse(r'n' is () -> Unit)
    Assert.isFalse(r'n' is C)

    Assert.isFalse(r'\f' is Int8)
    Assert.isFalse(r'\f' is Int16)
    Assert.isFalse(r'\f' is Int32)
    Assert.isFalse(r'\f' is Int64)
    Assert.isFalse(r'\f' is UInt8)
    Assert.isFalse(r'\f' is UInt16)
    Assert.isFalse(r'\f' is UInt32)
    Assert.isFalse(r'\f' is UInt64)
    Assert.isFalse(r'\f' is Float16)
    Assert.isFalse(r'\f' is Float32)
    Assert.isFalse(r'\f' is Float64)
    Assert.isTrue(r'\f' is Rune)
    Assert.isFalse(r'\f' is String)
    Assert.isFalse(r'\f' is Array<Int64>)
    Assert.isFalse(r'\f' is Unit)
    Assert.isFalse(r'\f' is () -> Unit)
    Assert.isFalse(r'\f' is C)

    Assert.isFalse(r'\r' is Int8)
    Assert.isFalse(r'\r' is Int16)
    Assert.isFalse(r'\r' is Int32)
    Assert.isFalse(r'\r' is Int64)
    Assert.isFalse(r'\r' is UInt8)
    Assert.isFalse(r'\r' is UInt16)
    Assert.isFalse(r'\r' is UInt32)
    Assert.isFalse(r'\r' is UInt64)
    Assert.isFalse(r'\r' is Float16)
    Assert.isFalse(r'\r' is Float32)
    Assert.isFalse(r'\r' is Float64)
    Assert.isTrue(r'\r' is Rune)
    Assert.isFalse(r'\r' is String)
    Assert.isFalse(r'\r' is Array<Int64>)
    Assert.isFalse(r'\r' is Unit)
    Assert.isFalse(r'\r' is () -> Unit)
    Assert.isFalse(r'\r' is C)

    Assert.isFalse(r'\v' is Int8)
    Assert.isFalse(r'\v' is Int16)
    Assert.isFalse(r'\v' is Int32)
    Assert.isFalse(r'\v' is Int64)
    Assert.isFalse(r'\v' is UInt8)
    Assert.isFalse(r'\v' is UInt16)
    Assert.isFalse(r'\v' is UInt32)
    Assert.isFalse(r'\v' is UInt64)
    Assert.isFalse(r'\v' is Float16)
    Assert.isFalse(r'\v' is Float32)
    Assert.isFalse(r'\v' is Float64)
    Assert.isTrue(r'\v' is Rune)
    Assert.isFalse(r'\v' is String)
    Assert.isFalse(r'\v' is Array<Int64>)
    Assert.isFalse(r'\v' is Unit)
    Assert.isFalse(r'\v' is () -> Unit)
    Assert.isFalse(r'\v' is C)

    Assert.isFalse(r'\b' is Int8)
    Assert.isFalse(r'\b' is Int16)
    Assert.isFalse(r'\b' is Int32)
    Assert.isFalse(r'\b' is Int64)
    Assert.isFalse(r'\b' is UInt8)
    Assert.isFalse(r'\b' is UInt16)
    Assert.isFalse(r'\b' is UInt32)
    Assert.isFalse(r'\b' is UInt64)
    Assert.isFalse(r'\b' is Float16)
    Assert.isFalse(r'\b' is Float32)
    Assert.isFalse(r'\b' is Float64)
    Assert.isTrue(r'\b' is Rune)
    Assert.isFalse(r'\b' is String)
    Assert.isFalse(r'\b' is Array<Int64>)
    Assert.isFalse(r'\b' is Unit)
    Assert.isFalse(r'\b' is () -> Unit)
    Assert.isFalse(r'\b' is C)

    Assert.isFalse(r'\$' is Int8)
    Assert.isFalse(r'\$' is Int16)
    Assert.isFalse(r'\$' is Int32)
    Assert.isFalse(r'\$' is Int64)
    Assert.isFalse(r'\$' is UInt8)
    Assert.isFalse(r'\$' is UInt16)
    Assert.isFalse(r'\$' is UInt32)
    Assert.isFalse(r'\$' is UInt64)
    Assert.isFalse(r'\$' is Float16)
    Assert.isFalse(r'\$' is Float32)
    Assert.isFalse(r'\$' is Float64)
    Assert.isTrue(r'\$' is Rune)
    Assert.isFalse(r'\$' is String)
    Assert.isFalse(r'\$' is Array<Int64>)
    Assert.isFalse(r'\$' is Unit)
    Assert.isFalse(r'\$' is () -> Unit)
    Assert.isFalse(r'\$' is C)

    Assert.isFalse(r'\u{2023}' is Int8)
    Assert.isFalse(r'\u{2023}' is Int16)
    Assert.isFalse(r'\u{2023}' is Int32)
    Assert.isFalse(r'\u{2023}' is Int64)
    Assert.isFalse(r'\u{2023}' is UInt8)
    Assert.isFalse(r'\u{2023}' is UInt16)
    Assert.isFalse(r'\u{2023}' is UInt32)
    Assert.isFalse(r'\u{2023}' is UInt64)
    Assert.isFalse(r'\u{2023}' is Float16)
    Assert.isFalse(r'\u{2023}' is Float32)
    Assert.isFalse(r'\u{2023}' is Float64)
    Assert.isTrue(r'\u{2023}' is Rune)
    Assert.isFalse(r'\u{2023}' is String)
    Assert.isFalse(r'\u{2023}' is Array<Int64>)
    Assert.isFalse(r'\u{2023}' is Unit)
    Assert.isFalse(r'\u{2023}' is () -> Unit)
    Assert.isFalse(r'\u{2023}' is C)
}
