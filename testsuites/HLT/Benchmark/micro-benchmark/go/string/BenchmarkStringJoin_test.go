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

var res_join string

func BenchmarkStringJoin_N8(b *testing.B){
	arr := []string{"s"}
	for i := 0; i < 7; i++{
		arr = append(arr, "s")
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_join = strings.Join(arr, "")
	}
}

func BenchmarkStringJoin_N32(b *testing.B){
	arr := []string{"s"}
	for i := 0; i < 31; i++{
		arr = append(arr, "s")
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_join = strings.Join(arr, "")
	}
}

func BenchmarkStringJoin_N256(b *testing.B){
	arr := []string{"s"}
	for i := 0; i < 255; i++{
		arr = append(arr, "s")
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_join = strings.Join(arr, "")
	}
}

func BenchmarkStringJoin_N1k(b *testing.B){
	arr := []string{"s"}
	for i := 0; i < 1023; i++{
		arr = append(arr, "s")
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_join = strings.Join(arr, "")
	}
}

func BenchmarkStringJoin_N1m(b *testing.B){
	arr := []string{"s"}
	for i := 0; i < 1024*1024 - 1; i++{
		arr = append(arr, "s")
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_join = strings.Join(arr, "")
	}
}