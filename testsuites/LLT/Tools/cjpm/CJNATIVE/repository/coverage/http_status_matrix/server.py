# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

import json
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse


def status_from_name(name):
    for prefix in ("idx", "dl", "pub"):
        if name.startswith(prefix):
            return int(name[len(prefix):])
    return 404


class Handler(BaseHTTPRequestHandler):
    def log_message(self, _format, *_args):
        return

    def send_payload(self, status, payload):
        data = payload.encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        path = urlparse(self.path).path
        parts = [part for part in path.split("/") if part]
        name = parts[-1] if parts else ""
        if parts and parts[0] == "index" and name.startswith("dl"):
            index = {
                "copyright": "Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.",
                "organization": "",
                "name": name,
                "version": "1.0.0",
                "dependencies": [],
                "test-dependencies": [],
                "script-dependencies": [],
                "sha256sum": "",
                "yanked": False,
                "cjc-version": "1.0.0",
                "index-version": 1,
            }
            self.send_payload(200, json.dumps(index) + "\n")
            return
        if parts and parts[0] == "pkg" and len(parts) >= 2:
            name = parts[1]
        status = status_from_name(name)
        self.send_payload(status, json.dumps({"errors": [{"message": "local error"}]}))

    def do_POST(self):
        length = int(self.headers.get("Content-Length", "0"))
        if length:
            self.rfile.read(length)
        parts = [part for part in urlparse(self.path).path.split("/") if part]
        name = parts[1] if len(parts) >= 2 else ""
        if name == "pubabort":
            self.connection.close()
            return
        status = status_from_name(name)
        self.send_payload(status, json.dumps({"errors": [{"message": "local error"}]}))


ThreadingHTTPServer(("127.0.0.1", int(sys.argv[1])), Handler).serve_forever()
