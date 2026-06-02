// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import M.*

var num = @outter
public class DeploymentSpec {
    @inner[isOmitempty = true]
    public var replicas1: Option<Int32> = 1

    @inner[isOmitempty = true]
    public var replicas2: Option<Int32> = 2

    @inner[isOmitempty = true]
    public var replicas3: Option<Int32> = 3

    @inner[isOmitempty = true]
    public var replicas4: Option<Int32> = 1

    @inner[isOmitempty = true]
    public var replicas5: Option<Int32> = 2

    @inner[isOmitempty = true]
    public var replicas6: Option<Int32> = 3

    @inner[isOmitempty = true]
    public var replicas7: Option<Int32> = 1

    @inner[isOmitempty = true]
    public var replicas8: Option<Int32> = 2

    @inner[isOmitempty = true]
    public var replicas9: Option<Int32> = 3
}
var num1 = @outter
public class DeploymentSpec {
    @inner[isOmitempty = true]
    public var replicas1: Option<Int32> = 1

    @inner[isOmitempty = true]
    public var replicas2: Option<Int32> = 2

    @inner[isOmitempty = true]
    public var replicas3: Option<Int32> = 3

    @inner[isOmitempty = true]
    public var replicas4: Option<Int32> = 4
}

main() {
    if (num != 9) {
        return 1
    }
    if (num1 != 4) {
        return 2
    }
    return 0
}
