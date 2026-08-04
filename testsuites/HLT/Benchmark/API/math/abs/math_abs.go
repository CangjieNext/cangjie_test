/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
        "math"
        "time"
        "fmt"
        )


var f64min float64 = -math.MaxFloat64
var f64max float64 = math.MaxFloat64
var count = 10000000

func abs_min_float64(){
    for n := 0; n < count; n++ {
		math.Abs(f64min)
	}
}
func abs_max_float64(){
    for n := 0; n < count; n++ {
		math.Abs(f64max)
	}
}



func main(){
    var before = time.Now()
    abs_min_float64()
    var cause = time.Since(before)
    var x = cause.Nanoseconds()
    fmt.Println("abs_min_float64:",x,"ns, ",float64(x)/float64(count),"ns/op")

    before = time.Now()
    abs_max_float64()
    cause = time.Since(before)
    x = cause.Nanoseconds()
    fmt.Println("abs_max_float64:",x,"ns, ",float64(x)/float64(count),"ns/op")
}
