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

var res_brackets byte

func BenchmarkStringBrackets1(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[0]
	}
}

func BenchmarkStringBrackets2(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[0]
	}
}

func BenchmarkStringBrackets3(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[512]
	}
}

func BenchmarkStringBrackets4(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[1023]
	}
}

func BenchmarkStringBrackets5(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[0]
	}
}

func BenchmarkStringBrackets6(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[512*1024]
	}
}

func BenchmarkStringBrackets7(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_brackets = str[1024*1024-1]
	}
}