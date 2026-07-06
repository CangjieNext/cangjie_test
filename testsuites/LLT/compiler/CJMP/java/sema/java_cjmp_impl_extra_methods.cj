// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Extra methods in specific @JavaImpl
// Scenario: Common class has methods, specific @JavaImpl adds extra methods
//           (requires native implementation in Java)
// Expected: Success - Extra methods allowed in @JavaImpl specific

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    common public init() {}
    public func getValue(): Int64 { 42 }
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
    specific public init() { super() }
    
    public func extraFunc(): Int64 { 999 }
    public func combinedFunc(): Int64 { getValue() + extraFunc() }
}