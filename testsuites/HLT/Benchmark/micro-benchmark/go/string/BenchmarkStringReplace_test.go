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

var res_replace string

func BenchmarkStringReplace_N8(b *testing.B){
	str := strings.Repeat("H", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N32(b *testing.B){
	str := strings.Repeat("H", 32)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N256(b *testing.B){
	str := strings.Repeat("H", 256)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1k(b *testing.B){
	str := strings.Repeat("R", 1023) + "H"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1k_half(b *testing.B){
	str := strings.Repeat("H", 512) + strings.Repeat("R", 512)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1k_all(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1m(b *testing.B){
	str := strings.Repeat("R", 1024*1024-1) + "H"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1m_half(b *testing.B){
	str := strings.Repeat("H", 512*1024) + strings.Repeat("R", 512*1024-1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}

func BenchmarkStringReplace_N1m_all(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_replace = strings.Replace(str, "H", "R", -1)
	}
}