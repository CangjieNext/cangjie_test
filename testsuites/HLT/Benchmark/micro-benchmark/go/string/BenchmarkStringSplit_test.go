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

var res_spilt []string

func BenchmarkStringSplit_N8(b *testing.B){
	str := strings.Repeat("H", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, "")
	}
}

func BenchmarkStringSplit_N32(b *testing.B){
	str := strings.Repeat("H", 32)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, "")
	}
}

func BenchmarkStringSplit_N256(b *testing.B){
	str := strings.Repeat("H", 256)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, "")
	}
}

func BenchmarkStringSplit_N1k_one(b *testing.B){
	str := strings.Repeat("H", 512) + "," + strings.Repeat("H", 511)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, ",")
	}
}

func BenchmarkStringSplit_N1k_all(b *testing.B){
	str := strings.Repeat("H", 512) + "," + strings.Repeat("H", 511)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, "")
	}
}

func BenchmarkStringSplit_N1m_one(b *testing.B){
	str := strings.Repeat("H", 512*1024) + "," + strings.Repeat("H", 512*1024-1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, ",")
	}
}

func BenchmarkStringSplit_N1m_all(b *testing.B){
	str := strings.Repeat("H", 512*1024) + "," + strings.Repeat("H", 512*1024-1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_spilt = strings.Split(str, "")
	}
}