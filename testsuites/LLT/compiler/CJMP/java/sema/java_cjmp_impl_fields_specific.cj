// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Fields in specific @JavaImpl (not exported to Java)
// Scenario: Common class has methods, specific @JavaImpl adds internal fields (package-private)
// Expected: Success - FFI-added fields marked with COMPILER_ADD attribute

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    common public init() {}
    public func process(): Int64 { 42 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror
open class Base {
    public init()
}

@JavaImpl
public specific class Test <: Base {
    var internalData: Int64 = 999
    var internalState: String = "internal"
    specific public init() { super() }
    
    public func getInternal(): Int64 { internalData }
    public func setInternal(v: Int64): Unit { internalData = v }
}