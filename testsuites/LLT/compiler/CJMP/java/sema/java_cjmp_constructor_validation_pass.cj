// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Constructor validation with multiple ctor options
// Scenario: Platform parent has both empty and parameterized constructors
// Expected: Success - parameterless constructor found, validation passes

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

// Common class
public common class TestMultiCtor {
    public init() {}
    public func process(): String { "common" }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

// Platform parent with multiple constructors (including parameterless one)
@JavaMirror
public open class JavaBaseClass {
    public init()
    public init(x: Int64)
    public init(s: String)
}

// Specific class extends platform parent
// Validation passes - parameterless constructor found in JavaBaseClass
@JavaImpl
public specific class TestMultiCtor <: JavaBaseClass { }
