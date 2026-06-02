/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./cfg.toml
// ERRCHECK: %compiler %cmp_opt --cfg="./" %f -o %output
// ASSERT: scan user defined condition in cfg.toml should be like: k1 = "v1", and each key-value pair occupies a separate line.

@When[lion == "target"]
var a = 0
@When[lion == "target_0"]
var a = 1

main() {
    a
}
