// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Referencing a higher-level decl from a lower scope renders both versions through
// APILevelVersion::ToDisplayString:
//   - the referenced level "20.1.5" has patch != 0  -> full triple form ("20.1.5")
//   - the scope level "20.1.0" has patch == 0, minor != 0 -> "major.minor" form ("20.1")

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f apilevel.%middle -Woff unused -o %output --cfg=APILevel_level=20.1.0
// ASSERT: scan higher than level of the current scope

import ohos.labels.*

@!APILevel[since: "20.1.5"]
public func newApi(): Unit {}

main() {
    newApi()
}
