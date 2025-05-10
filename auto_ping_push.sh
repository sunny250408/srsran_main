#!/bin/bash

cd ~/srsRAN_main || exit

# ping 결과 저장
ping 10.45.0.3 -c 5 > results/ping_result.txt

# GitHub에 커밋 및 푸시
git add results/ping_result.txt
git commit -m "자동화된 ping 결과 저장"
git push origin main
