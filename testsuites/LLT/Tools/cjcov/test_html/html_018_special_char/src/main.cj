// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 *  & <script>    & "  <script1> '

' <script>>    & " "  <<script1> '
 */
func funcA(): Unit {
    println("funcA")
}

func funcB(): Unit {
    println("funcB")
}

main(): Unit {
    funcA()
    funcB()
}
