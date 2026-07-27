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

var res_mul string

func BenchmarkStringMul_N1_10(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 10)
	}
}

func BenchmarkStringMul_N1_100(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 100)
	}
}

func BenchmarkStringMul_N1_1000(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 1000)
	}
}

func BenchmarkStringMul_N1k_10(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 10)
	}
}

func BenchmarkStringMul_N1k_100(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 100)
	}
}

func BenchmarkStringMul_N1k_1000(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 1000)
	}
}

func BenchmarkStringMul_N1m_10(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 10)
	}
}


func BenchmarkStringMul_N1m_100(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_mul = strings.Repeat(str, 100)
	}
}
