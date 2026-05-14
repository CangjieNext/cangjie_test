// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output --cfg=APILevel_level=24
// ASSERT: scan-7 sema_apilevel_invalid_version_format

import ohos.labels.*

@!APILevel[since: "20.01.02"]
public func f1() {}

@!APILevel[since: "0x1A.0.0"]
public func f2() {}

@!APILevel[since: "100"]
public func f3() {}

@!APILevel[since: "5.100.0"]
public func f4() {}

@!APILevel[since: "20.1.2.3"]
public func f5() {}

@!APILevel[since: "20"]
public func f6() {}

main() {
    @IfAvailable(level: 1.5, { => 1 }, { => 0 })
    @IfAvailable(level: "20", { => 1 }, { => 0 })
    0
}
