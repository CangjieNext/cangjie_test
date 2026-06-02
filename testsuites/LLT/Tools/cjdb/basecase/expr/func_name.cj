// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func f1() {()}
func f2() { 0 }
func f3(a:Int64) { 0 }
func f4(a:Int64, b:Int32) { 0 }
func f5(a:Int64, b:Int32, c:Int32) { 0 }
func f6(a:Int64, b:Int32, c:Float64, d:Float32, e:Bool) { 0 }

main(){
    f1
    f2
    f3
    f4
    f5
    f6
    0
}