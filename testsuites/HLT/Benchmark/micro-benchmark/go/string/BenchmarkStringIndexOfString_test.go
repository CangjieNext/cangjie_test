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

var res_indexOfString int

func BenchmarkStringIndexOfString_N1(b *testing.B){
	str := strings.Repeat("r", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1k_start(b *testing.B){
	str := strings.Repeat("r", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1k_mid(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1k_end(b *testing.B){
	str := strings.Repeat("H", 1023) + "r" 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1m_start(b *testing.B){
	str := strings.Repeat("r", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1m_mid(b *testing.B){
	str := strings.Repeat("H", 512*1024) + "r" + strings.Repeat("H", 512*1024-1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfString_N1m_end(b *testing.B){
	str := strings.Repeat("H", 1024*1024-1) + "r" 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "r")
	}
}

func BenchmarkStringIndexOfStringLongMatch_N1k(b *testing.B){
	str := strings.Repeat("H", 512) + "abcdefgabcdefgabcdef" + strings.Repeat("H", 512 - 20)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "abcdefgabcdefgabcdef")
	}
}

func BenchmarkStringIndexOfStringLongMatch_N1m(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "abcdefgabcdefgabcdef" + strings.Repeat("H", 1024 * 512 - 20)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_indexOfString = strings.Index(str, "abcdefgabcdefgabcdef")
	}
}