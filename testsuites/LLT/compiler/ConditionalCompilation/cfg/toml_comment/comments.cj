// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./cfg.toml
// EXEC: %compiler %cmp_opt %n.cj -o %output 
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

@When[feature1 == "enable"]
func fee() {
    println("feature1 enable")
}

@When[feature2 == "enable"]
func foo() {
    println("feature2 enable")
}

@When[feature3 == "#"]
func goo() {
    println("feature3 enable")
}

@When[feature4 == "\" # "]
func voo() {
    println("feature4 enable")
}

@When[feature5 == "#"]
func hoo() {
    println("feature5 enable")
}

main(){
    fee()
    foo()
    goo()
    voo()
    hoo()
}

/* SCAN
feature1 enable
feature2 enable
feature3 enable
feature4 enable
feature5 enable
*/
