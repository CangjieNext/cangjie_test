// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: test checks that @Frozen funcs do not duplication when exporting
// Only most specific is exported.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Deprecated
@Frozen
internal common func func_1772445374406_163(optionalParam_1772445374406_164 ! : UInt8 = UInt8(99), namedParam_1772445374406_166 ! : Int = throw Exception(), optionalParam_1772445374406_167 ! : Int32 = Int32(-11)) : Unit 

@Frozen
internal func func_1772445374406_155(param_1772445374406_156 : Int)  { // block id: 157
    var var_1772445374406_160 = func_1772445374406_163(namedParam_1772445374406_166 : throw Exception());
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

@Frozen
internal specific func func_1772445374406_163(optionalParam_1772445374406_164 ! : UInt8 , namedParam_1772445374406_166 ! : Int, optionalParam_1772445374406_167 ! : Int32 ) : Unit { // block id: 169
}


// SEPARATE-FILE: main.cj
// EXEC-0: %compiler main.cj -L. -lcmp -o %output
import cmp.*

main(): Int64 { 0 }
