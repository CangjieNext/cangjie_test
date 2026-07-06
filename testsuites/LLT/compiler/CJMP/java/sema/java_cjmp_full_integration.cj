// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Full integration - All components working together
// Scenario: Realistic Java interop with common/specific pair
// Expected: Success - all validation passes

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

// Common class (extends Object implicitly)
public common class JavaInteropClass {
    public init() {}
    
    public func processData(input: String): String {
        input
    }
    
    public func calculate(x: Int64, y: Int64): Int64 {
        x + y
    }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

// Platform base class (Java mirror)
@JavaMirror
public open class JavaPlatformBase {
    public init()
}

// Specific implementation (extends JavaPlatformBase)
// All validation passes: relaxation, annotations, constructor, CHIR patching, FFI
@JavaImpl
public specific class JavaInteropClass <: JavaPlatformBase { }
