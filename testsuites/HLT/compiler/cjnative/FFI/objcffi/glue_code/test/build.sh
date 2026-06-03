#!/bin/bash

ObjCInteropGen NSString.toml
cjc objc/foundation/*.cj main.cj -lobjc.lang -lobjc.internal --link-options "-framework Foundation"
