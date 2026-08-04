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

var res_notEqual bool

func benchmarkString_Equal(b *testing.B, n int) {
	str := strings.Repeat("H", n)
	str_equal := strings.Repeat("H", n)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_equal = str != str_equal
	}
}

func benchmarkString_NotEqual(b *testing.B, n int){
	str := strings.Repeat("H", n)
	str_notEqual := strings.Repeat("H", n - 1) + "S"
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_equal = str != str_notEqual
	}
}

func BenchmarkStringNotEqual_N1_Equal(b *testing.B)    {benchmarkString_Equal(b, 1)}
func BenchmarkStringNotEqual_N1k_Equal(b *testing.B)    {benchmarkString_Equal(b, 1024)}
func BenchmarkStringNotEqual_N1m_Equal(b *testing.B)    {benchmarkString_Equal(b, 1024 * 1024)}

func BenchmarkStringNotEqual_N1_notEqual(b *testing.B)    {benchmarkString_NotEqual(b, 1)}
func BenchmarkStringNotEqual_N1k_notEqual(b *testing.B)    {benchmarkString_NotEqual(b, 1024)}
func BenchmarkStringNotEqual_N1m_notEqual(b *testing.B)    {benchmarkString_NotEqual(b, 1024 * 1024)}