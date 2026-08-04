/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package https_server

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"testing"
)

func TestStartHttpsServer(t *testing.T) {
	handlers := map[string]func(w http.ResponseWriter, r *http.Request){
		"/get32":   getHandlerHttps(32),
		"/get256":  getHandlerHttps(256),
		"/get2048": getHandlerHttps(2048),
		"/get16384": getHandlerHttps(16384),
		"/get131072": getHandlerHttps(131072),
		"/get1048576": getHandlerHttps(1048576),
		"/get8388608": getHandlerHttps(8388608),
		"/get67108864": getHandlerHttps(67108864),
		"/post": postHandlerHttps(),
	}
	for path, handler := range handlers {
		http.HandleFunc(path, handler)
	}

	fmt.Println("Server started at https://127.0.0.1:62002")
	server := http.Server{
		Addr:    ":62002",
	}
	err := server.ListenAndServeTLS("data/end_rsa.cer", "data/end_rsa_private_key.pem")
	if err != nil {
		panic(err)
		return
	}
}

func getHandlerHttps(size int) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		body := make([]byte, size)
		w.Write(body)
	}
}

func postHandlerHttps() func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		ioutil.ReadAll(r.Body)
		w.WriteHeader(http.StatusOK)
	}
}