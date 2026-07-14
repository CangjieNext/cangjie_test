// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Platform parent missing parameterless constructor
// Scenario: Specific extends platform parent that lacks parameterless ctor
// Expected: Error - constructor validation fails (parameterless ctor required)

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

// Common class implicitly extends Object (default)
public common class TestRelaxation {
    public init() {}
    public func getValue(): Int64 { 42 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
package testpkg

import java.lang.*

// Platform parent WITHOUT parameterless constructor (only parameterized ctor)
@JavaMirror
public open class MyPlatformClass {
    public init(x: Int64)
}

// Specific class extends platform parent
// Relaxation allowed (Object→MyPlatformClass)
// BUT constructor validation fails - MyPlatformClass has no parameterless constructor
@JavaImpl
public specific class TestRelaxation <: MyPlatformClass { }

/*SCAN-IN
error: platform parent class 'MyPlatformClass' must have a parameterless constructor
  ==> p/testpkg.cj:16:1:
*/
