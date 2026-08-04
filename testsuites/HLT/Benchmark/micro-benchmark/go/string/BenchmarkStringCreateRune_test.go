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
)

var res_creatRune string

func BenchmarkStringCreateRune_N8(b *testing.B){
	arr := []rune{'H'}
	for i := 0; i < 7; i++{
		arr = append(arr, 'H')
	} 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_creatRune = string(arr)
	}
}

func BenchmarkStringCreateRune_N32(b *testing.B){
	arr := []rune{'H'}
	for i := 0; i < 31; i++{
		arr = append(arr, 'H')
	} 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_creatRune = string(arr)
	}
}

func BenchmarkStringCreateRune_N256(b *testing.B){
	arr := []rune{'H'}
	for i := 0; i < 255; i++{
		arr = append(arr, 'H')
	} 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_creatRune = string(arr)
	}
}

func BenchmarkStringCreateRune_N1K(b *testing.B){
	arr := []rune{'H'}
	for i := 0; i < 1023; i++{
		arr = append(arr, 'H')
	} 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_creatRune = string(arr)
	}
}

func BenchmarkStringCreateRune_N1M(b *testing.B){
	arr := []rune{'H'}
	for i := 0; i < 1024*1024 - 1; i++{
		arr = append(arr, 'H')
	} 
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_creatRune = string(arr)
	}
}