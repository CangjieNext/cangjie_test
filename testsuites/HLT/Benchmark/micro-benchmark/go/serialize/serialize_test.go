/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package serialize_test

import (
	"encoding/json"
	"io/ioutil"
	"os"
	"testing"
)
var dataPath = "../../script/data/json/"

func unMarshalHelper(b *testing.B, tag string) interface{} {
	filename := dataPath + tag + ".json"
	file, err := os.Open(filename)
	if err != nil {
		b.Error(err)
		return err
	}
	defer file.Close()
	content, err := ioutil.ReadAll(file)
	if err != nil {
		b.Error(err)
		return err
	}
  var res interface{}
  e := json.Unmarshal(content, &res)
  if e != nil {
    b.Error(e)
    return e
  }
	return res
}

func benchmarkUnMarshal(b *testing.B, tag string) {
	filename := dataPath + tag + ".json"
	file, err := os.Open(filename)
	if err != nil {
		b.Error(err)
		return
	}
	defer file.Close()
	content, err := ioutil.ReadAll(file)
	if err != nil {
		b.Error(err)
		return
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
    var res interface{}
    e := json.Unmarshal(content, &res)
    if e != nil {
      b.Error(e)
      return
    }
  }
}

func benchmarkMarshal(b *testing.B, content interface{}) {
  for i := 0; i < b.N; i++ {
    _, err := json.Marshal(content)
    if err != nil {
      b.Error(err)
      return
    }
  }
}

func benchMarkSerializeOfMarshal(b *testing.B, tag string) {
	res := unMarshalHelper(b, tag)
	b.ResetTimer()
	benchmarkMarshal(b, res)
}

func BenchmarkSerializable_8_1(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n8d1") }
func BenchmarkSerializable_8_2(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n8d2") }
func BenchmarkSerializable_8_4(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n8d4") }
func BenchmarkSerializable_8_8(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n8d8") }
func BenchmarkSerializable_8_32(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n8d32") }

func BenchmarkSerializable_64_1(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n64d1") }
func BenchmarkSerializable_64_2(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n64d2") }
func BenchmarkSerializable_64_4(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n64d4") }
func BenchmarkSerializable_64_8(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n64d8") }
func BenchmarkSerializable_64_32(b *testing.B)  { benchMarkSerializeOfMarshal(b, "n64d32") }


func BenchmarkDeserializable_8_1(b *testing.B)  { benchmarkUnMarshal(b, "n8d1") }
func BenchmarkDeserializable_8_2(b *testing.B)  { benchmarkUnMarshal(b, "n8d2") }
func BenchmarkDeserializable_8_4(b *testing.B)  { benchmarkUnMarshal(b, "n8d4") }
func BenchmarkDeserializable_8_8(b *testing.B)  { benchmarkUnMarshal(b, "n8d8") }
func BenchmarkDeserializable_8_32(b *testing.B)  { benchmarkUnMarshal(b, "n8d32") }

func BenchmarkDeserializable_64_1(b *testing.B)  { benchmarkUnMarshal(b, "n64d1") }
func BenchmarkDeserializable_64_2(b *testing.B)  { benchmarkUnMarshal(b, "n64d2") }
func BenchmarkDeserializable_64_4(b *testing.B)  { benchmarkUnMarshal(b, "n64d4") }
func BenchmarkDeserializable_64_8(b *testing.B)  { benchmarkUnMarshal(b, "n64d8") }
func BenchmarkDeserializable_64_32(b *testing.B)  { benchmarkUnMarshal(b, "n64d32") }

