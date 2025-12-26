// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor -Woff deprecated --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Deprecated
class TooOld {}

func f1(): TooOld { TooOld() }
common func f2(): ?TooOld { TooOld() }

@Deprecated
common func f3(): Unit

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-0: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
// ASSERT scan-1 sema_deprecated_warning
package cmp

platform func f2(): ?TooOld { None }
platform func f3() {}

// SEPARATE-FILE: u/usage.cj
// EXEC-PIPE-0: %compiler %diag_json --output-type=dylib --output-dir ./u -l cmp -L ./p --import-path ./p u/usage.cj 
// ASSERT scan-2 sema_deprecated_warning
package cmp.usage
import cmp.*

func useIt(p: TooOld) { // TooOld is deprecated
    f3() // check that deprecation propagation works
}

