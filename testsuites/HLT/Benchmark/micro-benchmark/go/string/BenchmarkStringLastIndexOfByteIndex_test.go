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

var res_LastIndexOfByte int

func BenchmarkStringLastIndexOfByteIndex_N1(b *testing.B){
	str := strings.Repeat("r", 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_start_start(b *testing.B){
	str := strings.Repeat("r", 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_start_mid(b *testing.B){
	str := strings.Repeat("r", 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[512:], flag) + 512
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_start_end(b *testing.B){
	str := strings.Repeat("r", 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024:], flag) + 1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_mid_start(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_mid_mid(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[512:], flag) + 512
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_mid_end(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024:], flag) + 1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_end_start(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_end_mid(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[512:], flag) + 512
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1k_end_end(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024:], flag) + 1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_start_start(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_start_mid(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[512*1024:], flag) + 512*1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_start_end(b *testing.B){
	str := strings.Repeat("r", 1024 * 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024*1024:], flag) + 1024*1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_mid_start(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_mid_mid(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024*512:], flag) + 1024*512
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_mid_end(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024*1024:], flag) + 1024*1024
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_end_start(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[0:], flag) + 0
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_end_mid(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024*512:], flag) + 1024*512
	}
}

func BenchmarkStringLastIndexOfByteIndex_N1m_end_end(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_LastIndexOfByte = strings.LastIndexByte(str[1024*1024:], flag) + 1024*1024
	}
}