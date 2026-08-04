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

var res_lessEqual bool

func BenchmarkStringLessEqual_N1_Less(b *testing.B){
	str1 := strings.Repeat("H", 1)
	str2 := strings.Repeat("S", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1_notLess(b *testing.B){
	str1 := strings.Repeat("S", 1)
	str2 := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1_Equal(b *testing.B){
	str1 := strings.Repeat("H", 1)
	str2 := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1k_Less(b *testing.B){
	str1 := strings.Repeat("H", 1024)
	str2 := strings.Repeat("H", 1023) + "S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1k_notLess(b *testing.B){
	str1 := strings.Repeat("H", 1023) + "S"
	str2 := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1k_Equal(b *testing.B){
	str1 := strings.Repeat("H", 1024)
	str2 := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1m_Less(b *testing.B){
	str1 := strings.Repeat("H", 1024*1024)
	str2 := strings.Repeat("H", 1024*1024-1)+"S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1m_notLess(b *testing.B){
	str1 := strings.Repeat("H", 1024*1024-1)+"S"
	str2 := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}

func BenchmarkStringLessEqual_N1m_Equal(b *testing.B){
	str1 := strings.Repeat("H", 1024*1024)
	str2 := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lessEqual = str1 <= str2
	}
}
