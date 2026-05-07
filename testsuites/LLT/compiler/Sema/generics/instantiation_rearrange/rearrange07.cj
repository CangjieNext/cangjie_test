// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1

import std.deriving.*

@Derive[ToString, Equatable]
public enum MessageArrayValue {
    ARRAYSTRING(Array<String>) | ARRAYI64(Array<Int64>) | ARRAYF64(Array<Float64>) | ARRAYBOOL(Array<Bool>) | ...
}

main() {
    MessageArrayValue.ARRAYSTRING(["1"])
    0
}
