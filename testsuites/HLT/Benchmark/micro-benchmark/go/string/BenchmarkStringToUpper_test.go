/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package string_test

import (
	"testing"
	"strings"
)

var res_toUpper string

func BenchmarkStringToUpper_N8(b *testing.B){
	str := strings.Repeat("h", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_toUpper = strings.ToUpper(str)
	}
}

func BenchmarkStringToUpper_N32(b *testing.B){
	str := strings.Repeat("h", 32)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_toUpper = strings.ToUpper(str)
	}
}

func BenchmarkStringToUpper_N256(b *testing.B){
	str := strings.Repeat("h", 256)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_toUpper = strings.ToUpper(str)
	}
}

func BenchmarkStringToUpper_N1k(b *testing.B){
	str := strings.Repeat("h", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_toUpper = strings.ToUpper(str)
	}
}

func BenchmarkStringToUpper_N1m(b *testing.B){
	str := strings.Repeat("h", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_toUpper = strings.ToUpper(str)
	}
}