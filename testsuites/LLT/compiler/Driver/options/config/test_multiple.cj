// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %f --cfg="feature1=1" --cfg="feature1=2" 2>&1 | compare %f
// ASSERT: regex error.*: user defined condition's key can not repeat
// ASSERT: regex-not warning

@When[feature1 == "1"]
func test() {
    println(1)
}

@When[feature1 == "2"]
func test() {
    println(2)
}

main() {
    test()
}
