// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative: malformed version components must be rejected by
// APILevelVersion::IsValidFormat / IsDecimalComponent.
//   "20..5"  -> empty middle component (consecutive dots)
//   ".5.0"   -> empty leading component (leading dot)
//   "20.1."  -> empty trailing component (trailing dot)
//   "1.02.3" -> leading-zero component "02"

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output --cfg=APILevel_level=24
// ASSERT: scan-4 sema_apilevel_invalid_version_format

import ohos.labels.*

@!APILevel[since: "20..5"]
public func f1() {}

@!APILevel[since: ".5.0"]
public func f2() {}

@!APILevel[since: "20.1."]
public func f3() {}

@!APILevel[since: "1.02.3"]
public func f4() {}
