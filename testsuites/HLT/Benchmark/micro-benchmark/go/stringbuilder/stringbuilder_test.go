/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package stringbuilder

import (
	"testing"
	"strings"
)

// go 语言推荐使用 strings.builder 作为string的构造器， 性能优于 bytes.Buffer

func benchmarkStringBuilder_Init_Empty(b *testing.B, n int) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		// 扩容和初始化定义的容量大小略有区别
		builder.Grow(n)
	}
}

func BenchmarkStringBuilderInit_Empty_N32(b *testing.B)    {benchmarkStringBuilder_Init_Empty(b, 32)}
func BenchmarkStringBuilderInit_Empty_N1k(b *testing.B)    {benchmarkStringBuilder_Init_Empty(b, 1024)}
func BenchmarkStringBuilderInit_Empty_N1m(b *testing.B)    {benchmarkStringBuilder_Init_Empty(b, 1024 * 1024)}

func benchmarkStringBuilder_Init_Fromstr(b *testing.B, n int) {
	str := strings.Repeat("A", n)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString(str)
	}
}

func BenchmarkStringBuilderInit_From_str_N32(b *testing.B)    {benchmarkStringBuilder_Init_Fromstr(b, 32)}
func BenchmarkStringBuilderInit_From_str_N1k(b *testing.B)    {benchmarkStringBuilder_Init_Fromstr(b, 1024)}
func BenchmarkStringBuilderInit_From_str_N1m(b *testing.B)    {benchmarkStringBuilder_Init_Fromstr(b, 1024 * 1024)}

// 无直接的构造方法，仅供参考
func benchmarkStringBuilder_Init_Fromrune(b *testing.B, n int) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		for j := 0; j < n; j++ {
			builder.WriteRune('A')
		}
	}
}

func BenchmarkStringBuilderInit_Fromrune_N32(b *testing.B)    {benchmarkStringBuilder_Init_Fromrune(b, 32)}
func BenchmarkStringBuilderInit_Fromrune_N1k(b *testing.B)    {benchmarkStringBuilder_Init_Fromrune(b, 1024)}
func BenchmarkStringBuilderInit_Fromrune_N1m(b *testing.B)    {benchmarkStringBuilder_Init_Fromrune(b, 1024 * 1024)}

// 没有从rune数组的构造方法，使用[]byte
func benchmarkStringBuilder_Init_Fromrunearray(b *testing.B, n int) {
	arr := make([]byte, n)
	for i := 0; i < n; i ++ {
		arr[i] = 'A'
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.Write(arr)
	}
}

func BenchmarkStringBuilderInit_Fromarray_N32(b *testing.B)    {benchmarkStringBuilder_Init_Fromrunearray(b, 32)}
func BenchmarkStringBuilderInit_Fromarray_N1k(b *testing.B)    {benchmarkStringBuilder_Init_Fromrunearray(b, 1024)}
func BenchmarkStringBuilderInit_Fromarray_N1m(b *testing.B)    {benchmarkStringBuilder_Init_Fromrunearray(b, 1024 * 1024)}

// go 的string 构造器提供的写入方法有限，未提供方法的按照string模拟写入
func BenchmarkStringBuilderAppend_Bool(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("true")
	}	
}

func BenchmarkStringBuilderAppend_Int64(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("-9223372036854775808")
	}	
}

func BenchmarkStringBuilderAppend_Int32(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("-2147483648")
	}	
}

func BenchmarkStringBuilderAppend_Int16(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("-32768")
	}	
}

func BenchmarkStringBuilderAppend_Int8(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("-128")
	}	
}

func BenchmarkStringBuilderAppend_Float64(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("3.1415926535")
	}	
}

func BenchmarkStringBuilderAppend_Float32(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString("3.1415")
	}	
}

func BenchmarkStringBuilderAppend_Rune(b *testing.B) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteRune('A')
	}	
}

func benchmarkStringBuilder_Append_String(b *testing.B, n int) {
	str := strings.Repeat("A", n)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.WriteString(str)
	}
}

func BenchmarkStringBuilderAppend_String_N32(b *testing.B)    {benchmarkStringBuilder_Append_String(b, 32)}
func BenchmarkStringBuilderAppend_String_N1k(b *testing.B)    {benchmarkStringBuilder_Append_String(b, 1024)}
func BenchmarkStringBuilderAppend_String_N1m(b *testing.B)    {benchmarkStringBuilder_Append_String(b, 1024 * 1024)}

func benchmarkStringBuilder_Append_RuneArray(b *testing.B, n int) {
	arr := make([]byte, n)
	for i := 0; i < n; i ++ {
		arr[i] = 'A'
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.Write(arr)
	}
}

func BenchmarkStringBuilderAppend_RuneArray_N32(b *testing.B)    {benchmarkStringBuilder_Append_RuneArray(b, 32)}
func BenchmarkStringBuilderAppend_RuneArray_N1k(b *testing.B)    {benchmarkStringBuilder_Append_RuneArray(b, 1024)}
func BenchmarkStringBuilderAppend_RuneArray_N1m(b *testing.B)    {benchmarkStringBuilder_Append_RuneArray(b, 1024 * 1024)}

func benchmarkStringBuilder_Append_StringBuilder(b *testing.B, n int) {
	str := strings.Repeat("A", n)
	var builder1 strings.Builder
	builder1.WriteString(str)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		_ = builder1
	}
}

func BenchmarkStringBuilderAppend_StringBuilder_N32(b *testing.B)    {benchmarkStringBuilder_Append_StringBuilder(b, 32)}
func BenchmarkStringBuilderAppend_StringBuilder_N1k(b *testing.B)    {benchmarkStringBuilder_Append_StringBuilder(b, 1024)}
func BenchmarkStringBuilderAppend_StringBuilder_N1m(b *testing.B)    {benchmarkStringBuilder_Append_StringBuilder(b, 1024 * 1024)}

func benchmarkStringBuilder_AppendFromUtf8(b *testing.B, n int) {
	arr := make([]byte, n)
	for i := 0; i < n; i ++ {
		arr[i] = 'A'
	}
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.Write(arr)
	}
}

func BenchmarkStringBuilderAppendFromUtf8_N32(b *testing.B)    {benchmarkStringBuilder_AppendFromUtf8(b, 32)}
func BenchmarkStringBuilderAppendFromUtf8_N1k(b *testing.B)    {benchmarkStringBuilder_AppendFromUtf8(b, 1024)}
func BenchmarkStringBuilderAppendFromUtf8_N1m(b *testing.B)    {benchmarkStringBuilder_AppendFromUtf8(b, 1024 * 1024)}

func benchmarkStringBuilder_ToString(b *testing.B, n int) {
	str := strings.Repeat("A", n)
	var builder strings.Builder
	builder.WriteString(str)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		_ = builder.String()
	}
}

func BenchmarkStringBuilderToString_N32(b *testing.B)    {benchmarkStringBuilder_ToString(b, 32)}
func BenchmarkStringBuilderToString_N1k(b *testing.B)    {benchmarkStringBuilder_ToString(b, 1024)}
func BenchmarkStringBuilderToString_N1m(b *testing.B)    {benchmarkStringBuilder_ToString(b, 1024 * 1024)}

func benchmarkStringBuilder_Reserve(b *testing.B, n int) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.Grow(n)
	}
}

func BenchmarkStringBuilderReserve_N32(b *testing.B)    {benchmarkStringBuilder_Reserve(b, 32)}
func BenchmarkStringBuilderReserve_N1k(b *testing.B)    {benchmarkStringBuilder_Reserve(b, 1024)}
func BenchmarkStringBuilderReserve_N1m(b *testing.B)    {benchmarkStringBuilder_Reserve(b, 1024 * 1024)}

func benchmarkStringBuilder_Reset(b *testing.B, n int) {
	for i := 0; i < b.N; i ++{
		var builder strings.Builder
		builder.Grow(n)
		builder.Reset()
	}
}

func BenchmarkStringBuilderReset_N32(b *testing.B)    {benchmarkStringBuilder_Reset(b, 32)}
func BenchmarkStringBuilderReset_N1k(b *testing.B)    {benchmarkStringBuilder_Reset(b, 1024)}
func BenchmarkStringBuilderReset_N1m(b *testing.B)    {benchmarkStringBuilder_Reset(b, 1024 * 1024)}