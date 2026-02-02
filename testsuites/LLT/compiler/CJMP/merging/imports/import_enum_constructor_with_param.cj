//  Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental  c/c.cj --output-type=chir --output-dir ./c
package cmp

public common struct Struct_1769682625592_159<T0, T1> {
    public init() { // block id: 161
    }
}

public enum Enum_1769682625592_194 {
    defaultValue |
    enumValue_1769682625592_467(Struct_1769682625592_159<Bool, Rune>, (Int8, Int8))
}  
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp
public platform struct Struct_1769682625592_159<T0, T1> {}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj -L. -lcmp -o %output
// EXEC-PIPE: %run %output
import cmp.*
main(): Int64 {
    0
}