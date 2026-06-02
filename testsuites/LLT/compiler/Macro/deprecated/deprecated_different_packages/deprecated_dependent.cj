// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:deprecated_dependence.cj 
// (CJNATIVE)EXEC-PIPE: %compiler %compile_shared_lib_opt deprecated_dependence.cj -o libdependence.%dylib_suffix
// (CJNATIVE)EXEC-PIPE: %compiler %cmp_opt -L. -ldependence -o %n.%suffix %f 2>&1 | compare %f

// NOTE: usage of @Deprecated API defined in another package
// is reported inside @Deprecated declaration
// ASSERT: scan function 'foo' is deprecated.
package x

import dependence.*

@Deprecated
func boo() {
    foo()
}

main() {}


