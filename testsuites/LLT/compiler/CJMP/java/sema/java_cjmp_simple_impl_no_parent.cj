// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: @JavaImpl with no explicit parent (JObject auto-inserted by PreCheck)
// Scenario: Common extends Object, specific @JavaImpl has no explicit parent
//           PreCheck auto-inserts JObject as parent for @JavaImpl
// Expected: Success - Object→JObject relaxation allowed
// 
// This is the simplest and most fundamental case for Java FFI interop.
// JObject only has JAVA_MIRROR attribute (not JAVA_MIRROR_SUBTYPE), 
// which was the bug that existed before.

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

// Common class implicitly extends Object (default)
// Contains all the logic/members
public common class TestSimpleImpl {
    public init() { }
    public func getValue(): Int64 { 42 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.JObject

// NO explicit parent declaration!
// PreCheck phase will auto-insert JObject as parent for @JavaImpl classes
// This creates the Object→JObject relaxation scenario
// JObject has JAVA_MIRROR attribute (not JAVA_MIRROR_SUBTYPE)
// This is the critical case that existing tests missed
@JavaImpl
public specific class TestSimpleImpl { }