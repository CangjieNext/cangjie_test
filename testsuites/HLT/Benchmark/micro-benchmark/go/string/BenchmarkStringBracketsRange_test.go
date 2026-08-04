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

var res_bracketsRange string

func BenchmarkStringBracketsRange_N1(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1]
	}
}

func BenchmarkStringBracketsRange_N1k_one(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1]
	}
}

func BenchmarkStringBracketsRange_N1k_middle(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:512]
	}
}

func BenchmarkStringBracketsRange_N1k_end(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1024]
	}
}

func BenchmarkStringBracketsRange_N1m_one(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1]
	}
}

func BenchmarkStringBracketsRange_N1m_middle(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1024*512]
	}
}

func BenchmarkStringBracketsRange_N1m_end(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_bracketsRange = str[0:1024*1024]
	}
}