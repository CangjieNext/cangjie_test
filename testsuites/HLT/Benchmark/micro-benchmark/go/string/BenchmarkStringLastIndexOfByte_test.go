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

var res_lastIndexOfByte int

func BenchmarkStringLastIndexOfByte_N1(b *testing.B){
	str := strings.Repeat("r", 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1k_start(b *testing.B){
	str := strings.Repeat("r", 1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1k_mid(b *testing.B){
	str := strings.Repeat("H", 512) + "r" + strings.Repeat("H", 511)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1k_end(b *testing.B){
	str := strings.Repeat("H", 1023) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1m_start(b *testing.B){
	str := strings.Repeat("r", 1024*1024)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1m_mid(b *testing.B){
	str := strings.Repeat("H", 1024 * 512) + "r" + strings.Repeat("H", 1024 * 512 - 1)
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}

func BenchmarkStringLastIndexOfByte_N1m_end(b *testing.B){
	str := strings.Repeat("H", 1024 * 1024 - 1) + "r"
	flag := byte('r')
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_lastIndexOfByte = strings.LastIndexByte(str, flag)
	}
}