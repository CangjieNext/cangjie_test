// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Common class has non-Object parent (relaxation NOT allowed)
// Scenario: Common extends SomeBaseClass, specific @JavaImpl (auto-inserts JObject as parent)
// Expected: Error - super-type mismatch (SomeBaseClass != JObject), relaxation restricted to Object only

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg
import java.lang.JObject

// Custom base class (NOT Object)
public open class SomeBaseClass {
    public init() {}
    public func baseMethod(): Int64 { 100 }
}

// Common class has EXPLICIT non-Object parent
// This breaks relaxation precondition: comSupClass->identifier must be "Object"
public common class TestMismatch <: SomeBaseClass {
    public init() { super() }
    public func getValue(): Int64 { 42 }
    
    public func testInheritance(): Int64 {
        baseMethod()
    }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
package testpkg
import java.lang.JObject

// Specific class with @JavaImpl annotation
// During PreCheck phase, JObject is auto-inserted as parent:
//   TestMismatch <: JObject (due to @JavaImpl)
// After PreCheck:
//   - Common parent: SomeBaseClass
//   - Specific parent: JObject
// Relaxation check fails: SomeBaseClass != Object
// Result: No relaxation, super-type mismatch error
@JavaImpl
public specific class TestMismatch { }

/* SCAN-IN
error: 'specific' class super types is not match 'common' super types
*/
