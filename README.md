#srsRAN Tutorial Project

srsRAN을 기반으로 한 srsUE를 사용한 srsRAN gNB

-----

## 환경 정보
-OS : Ubuntu 22.04
-srsRAN: v22.10
-Core : Open5GS
-연결 방식 : ZMQ(소프트웨어 기반 연결)

-----

## 폴더 구성
- `libzmq/` - ZMQ 라이브러리
- `srsRAN_Project/` - gNB 관련 설정 및 실행 코드
- `srsRAN_4G/` - UE 관련 설정
- `uhd/` - SDR 드라이버 구성 파일
- `results/` -실습 결과 파일 저장

-----

## 실행방법

## 용어설명
-라우팅 구성 : 호스트 머신에서 UE로 가는 경로를 수동으로 추가해주는 것 -> 호스트 머신에서 UE IP로 ping을 보내는 경로 생성


## 결과파일

- [`results/routing_result_clean.txt`](./results/routing_result_clean.txt)  
→ `ip addr`, `ip route`, `route -n` 등을 실행한 결과를 `script` 명령어로 저장한 클린 로그입니다.

-----

## 사용한 명령어
-라우팅 관련
```bash
#내 컴퓨터의 네트워크 인터페이스 확인
ip addr

#라우팅 경로 추가
sudo ip route add 10.45.0.0/16 via 10.45.0.1

#라우팅 테이블 출력
route -n


