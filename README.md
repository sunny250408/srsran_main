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
`[UE] ⇄ [gNB] ⇄ [Core Network (UPF, AMF 등)] ⇄ [외부망 or 서버]`
| 용어 | 용어 설명 |
|------|-----------|
| 라우팅 구성 | 호스트가 Core Network (UPF)를 통해 UE에 접근할 수 있도록 라우팅 테이블을 수정하는 것 |
| ping |  네트워크에서 상대방 IP 주소가 응답 가능한지 확인하는 것 |

## 결과 파일 

| 파일 경로 | 
|-----------|
| `results/routing_result.txt` |
| `results/ping_result.txt` |


-----

## 사용한 명령어
-라우팅 관련
```bash
#cd /ect/open5gs안에서 실행
#내 컴퓨터의 네트워크 인터페이스 확인
ip addr

#라우팅 경로 추가
sudo ip route add 10.45.0.0/16 via 10.45.0.1

#라우팅 테이블 출력
route -n

#`UE ↔ Core` (특히 UPF) 간의 IP 통신이 정상적으로 가능하도록 경로를 설정
#`[Host PC] → (라우팅 경로) → [Core (UPF)] → [UE (10.45.x.x)]`이런식으로 연결

```
-ping 관련
```bash
#cd ~/srsRAN_main/srsRAN_4G/build/srsue/src에서 실행
# `ue1`이라는 가상의 네트워크 공간(netns)을 생성. srsUE는 이 공간 안에서 동작함.
sudo ip netns add ue1

#cd ~/srsRAN_main/srsRAN_Project/build/apps/gnb
#빌드된 가상 gNB를 실행. ZMQ 기반 가상 무선 링크를 통해 Core Network와 연결
sudo ./gnb -c./gnb_zmq.yaml

#cd ~/srsRAN_main/srsRAN_4G/build/srsue/sr
#가상 UE 실행. gNB와 연결된 후 Core Network에서 IP를 할당받음.
sudo ./srsue ue_zmq.conf

#`[UE] ⇄ [gNB] ⇄ [Open5GS Core Network]`
#gnb가 open5gs에 연결되고 ue가 gnb와 연결되었음을 확인 할 수 있
```


