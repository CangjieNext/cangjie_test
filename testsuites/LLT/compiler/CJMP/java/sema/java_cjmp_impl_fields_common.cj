// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Fields in common class with @JavaImpl specific
// Scenario: Common class has fields (let and var), specific @JavaImpl extends @JavaMirror parent
// Expected: Success - Fields preserved from common during CJMP merge

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    public let count: Int64 = 100
    public var status: Bool = true
    common public init() {}
    public func getCount(): Int64 { count }
    public func getStatus(): Bool { status }
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
}