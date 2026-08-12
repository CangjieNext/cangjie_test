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

var res_equal bool

func benchmarkStringEqual(b *testing.B, n int) {
	str := strings.Repeat("H", n)
	str_equal := strings.Repeat("H", n)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_equal = str == str_equal
	}
}

func BenchmarkStringEqual_N1_equal(b *testing.B)    { benchmarkStringEqual(b, 1) }
func BenchmarkStringEqual_N1k_equal(b *testing.B)    { benchmarkStringEqual(b, 1024) }
func BenchmarkStringEqual_N1m_equal(b *testing.B)    { benchmarkStringEqual(b, 1024 * 1024) }

func benchmarkStringNotEqual(b *testing.B, n int){
	str := strings.Repeat("H", n)
	str_notEqual := strings.Repeat("H", n - 1) + "S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_equal = str == str_notEqual
	}
}

func BenchmarkStringEqual_N1_notEqual(b *testing.B)    { benchmarkStringNotEqual(b, 1) }
func BenchmarkStringEqual_N1k_notEqual(b *testing.B)    { benchmarkStringNotEqual(b, 1024) }
func BenchmarkStringEqual_N1m_notEqual(b *testing.B)    { benchmarkStringNotEqual(b, 1024 * 1024) }