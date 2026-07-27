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

// go 的 LastIndexByte 实际上无法提供指定索引能力， 本用例仅供参考

var res_LastIndexOfString int

func BenchmarkStringLastIndexOfStringIndex_N1(b *testing.B){
	str := strings.Repeat("r", 1)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_start_start(b *testing.B){
	str := strings.Repeat("r", 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_start_mid(b *testing.B){
	str := strings.Repeat("r", 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[512:], "r") + 512
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_start_end(b *testing.B){
	str := strings.Repeat("r", 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024:], "r") + 1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_mid_start(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_mid_mid(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[512:], "r") + 512
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_mid_end(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024:], "r") + 1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_end_start(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_end_mid(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[512:], "r") + 512
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1k_end_end(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024:], "r") + 1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_start_start(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_start_mid(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[512*1024:], "r") + 512*1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_start_end(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024*1024:], "r") + 1024*1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_mid_start(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_mid_mid(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024*512:], "r") + 1024*512
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_mid_end(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024*1024:], "r") + 1024*1024
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_end_start(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[0:], "r") + 0
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_end_mid(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024*512:], "r") + 1024*512
	}
}

func BenchmarkStringLastIndexOfStringIndex_N1m_end_end(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"

	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfString = strings.LastIndex(str[1024*1024:], "r") + 1024*1024
	}
}