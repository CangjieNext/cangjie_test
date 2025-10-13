// EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// ASSERT: scan [NoSideEffectMarker] The call to function round at [2686,1] has been mark as no side effect.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import std.math

main() {
    let a = math.round(1.1)
    let b = math.round(1.2)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
