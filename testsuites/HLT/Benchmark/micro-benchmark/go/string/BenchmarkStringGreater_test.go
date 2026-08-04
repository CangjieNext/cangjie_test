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

var res_greater bool

func BenchmarkStringGreater_N1_Greater(b *testing.B){
	str1 := strings.Repeat("H", 1)
	str2 := strings.Repeat("S", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}

func BenchmarkStringGreater_N1_notGreater(b *testing.B){
	str1 := strings.Repeat("S", 1)
	str2 := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}

func BenchmarkStringGreater_N1k_Greater(b *testing.B){
	str1 := strings.Repeat("H", 1024)
	str2 := strings.Repeat("H", 1023) + "S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}

func BenchmarkStringGreater_N1k_notGreater(b *testing.B){
	str1 := strings.Repeat("H", 1023) + "S"
	str2 := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}

func BenchmarkStringGreater_N1m_Greater(b *testing.B){
	str1 := strings.Repeat("H", 1024*1024)
	str2 := strings.Repeat("H", 1024*1024-1)+"S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}

func BenchmarkStringGreater_N1m_notGreater(b *testing.B){
	str1 := strings.Repeat("H", 1024*1024-1)+"S"
	str2 := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_greater = str1 > str2
	}
}