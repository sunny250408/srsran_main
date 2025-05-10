#!/bin/bash

# 라우팅 정보 저장
mkdir -p ~/srsRAN_main/results
route -n > ~/srsRAN_main/results/routing_result.txt

# GitHub에 반영
cd ~/srsRAN_main
git add results/routing_result.txt
git commit -m "update routing result"
git push origin main
