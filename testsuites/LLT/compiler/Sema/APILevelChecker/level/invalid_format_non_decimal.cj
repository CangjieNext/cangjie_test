// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative: a version component that contains a non-decimal character must be
// rejected by APILevelVersion::IsDecimalComponent's character-scan branch.
// The existing format cases never reach this branch ("0x1A" is short-circuited
// by the leading-zero check because it starts with '0'), so these inputs are
// what actually exercises it.
//   "1.a.0" / "x.2.3" / "1.2.z" -> a letter inside a component
//   "1.-1.0"                    -> a sign character
//   "1.2.3beta"                 -> trailing letters after digits

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output --cfg=APILevel_level=24
// ASSERT: scan-5 sema_apilevel_invalid_version_format

import ohos.labels.*

@!APILevel[since: "1.a.0"]
public func f1() {}

@!APILevel[since: "x.2.3"]
public func f2() {}

@!APILevel[since: "1.2.z"]
public func f3() {}

@!APILevel[since: "1.-1.0"]
public func f4() {}

@!APILevel[since: "1.2.3beta"]
public func f5() {}

main() {}
