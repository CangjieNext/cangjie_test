/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@When[os  ==  "Windows"]
func   platformFunc() {
    println("Windows")
}

@When[os  ==  "Linux"]
func  platformFunc() {
    println("Linux")
}

@When[os  ==  "macOS"]
func   platformFunc() {
    println("macOS")
}

@When[debug]
func  debugOnly() {
    println("debug")
}

@When[os   ==   "Windows"   &&   arch   ==   "x86_64"]
func  winX64Only() {
    println("win x64")
}

main() {
    platformFunc()
}
