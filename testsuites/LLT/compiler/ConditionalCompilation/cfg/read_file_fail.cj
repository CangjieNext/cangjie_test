// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./cfg.toml
// (not Windows)EXEC: %chmod 000 ./cfg.toml
// (Windows)EXEC: icacls ./cfg.toml /deny %USERNAME%:R
// ERRCHECK: %compiler %cmp_opt %conditional_compilation_config_opt="./" %f
// ASSERT: regex error.*open file failed

@When[k == "target"] 
var a = 0

@When[k == "default"] 
var a = 1

main () {
    a
}