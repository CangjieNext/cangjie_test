// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: @JavaImpl common field redeclared on the specific side must not crash the compiler
// Scenario: Common class declares an uninitialized field, the specific @JavaImpl class
//           redeclares it as `specific var x`.
// Expected: The specific side compiles to CHIR without an internal compiler error
//           (the field is relocated to the registry companion and gets CHIR storage).

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    common var x: Int32
    common public init()
    public func bump(): Int32 { x += 1; x }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=chir --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not Internal Compiler Error
package testpkg

import java.lang.*

@JavaMirror
open class Base {
    public init()
}

@JavaImpl
public specific class Test <: Base {
    specific var x: Int32
    specific public init() { super() }
}
