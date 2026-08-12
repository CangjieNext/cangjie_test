// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.mpp_perf.platform }
package mpp_perf

public specific func platformMessage(): String {
    "multiplatform performance"
}

main(): Unit {
    println(platformMessage())
}
