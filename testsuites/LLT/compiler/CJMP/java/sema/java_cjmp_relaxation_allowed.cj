// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Scenario: Common extends Object, specific @JavaImpl extends @JavaMirror parent
// Expected: Success - relaxation allowed, annotation relaxation works

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

// Common class implicitly extends Object (default)
// Contains all the logic/members
public common class TestRelaxation {
    public init() { }
    public func getValue(): Int64 { 42 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

// Platform parent @JavaMirror class
@JavaMirror
public open class MyJavaPlatform {
    public init()
}

// Parent Class Relaxation (Object→MyJavaPlatform)
// Annotation relaxation (@JavaImpl on specific only)
// Specific class is empty - members inherited from merged common
@JavaImpl
public specific class TestRelaxation <: MyJavaPlatform { }

