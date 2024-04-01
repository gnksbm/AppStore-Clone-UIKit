//
//  MockApplicationRepository.swift
//  FeatureDependency
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

import RxSwift

#if DEBUG
final class MockApplicationRepository: ApplicationRepository {
    func searchApp(request: SearchAppRequest) -> Observable<[SearchAppMinResponse]> {
        .just(
            [
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/6b/38/75/6b38752f-71da-9424-89d1-07ac92dde54f/AppIcon-1x_U007ephone-85-220.png/60x60bb.jpg"),
                    appName: "버스어디: 실시간 버스, 정기 알람, 즐겨찾기",
                    appDescription: "◆ 서울 버스가 내 손 안에!\n서울시의 실시간 버스정보 확인이 가능합니다.\n\n◆ 자주 이용하는 버스 도착 전, 확인하고 싶다면!\n자주 이용하는 버스가 있다면, 즐겨찾기로 저장 후 첫 화면에서 바로 확인할 수 있습니다.\n\n◆ 정기알람으로 매일 출퇴근 길을 편안하게!\n정기알람을 이용해 매일 이용하는 버스가 현재 정류장에 도착하기 몇 분 전인지 확인해보세요.\n\n\n[서비스 접근 권한 안내]\n▸ 선택 접근 권한\n위치 : 주변 버스 정류장 조회\n알람 : 사운드 및 아이콘 배지로 스케줄알람 제공\n\n\n[고객센터]\n- 메일 : exok1and1m@gmail.com\n- 홈페이지 : https://buscoming.tistory.com"
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/ca/ee/c3/caeec33a-1383-afb9-3cfb-a89a915c3041/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg"),
                    appName: "플레이투게더 (Play Together)",
                    appDescription: "언제 어디서나, 일단 놀자!\n플레이투게더에서는 모든 곳이 놀이터! 내 마음대로 꾸미고, 친구들과 이야기하며, 질릴 때까지 놀 수 있어요! 언제 어디서나, 일단 놀자!\n\n게임하며 놀자!\n오늘은 어떤 게임을 하고 놀까?! 달리기 레이스? 좀비 바이러스? 배틀로얄? 전세계 친구들과 스릴 넘치는 다양한 미니 게임을 즐겨 보세요!\n\n집 꾸미며 놀자!\n개성 넘치는 가구들로 상상만하던 집을 직접 꾸밀 수 있다고?! 멋지고~ 귀엽고! 이상한? 나만의 집을 만들어서 친구들을 초대해 보세요!\n\n뭘 입고 놀까?\n기분에 따라, 분위기에 따라 마음대로 옷을 바꿔 입어 볼까? 개성이 넘치는 나만의 캐릭터를 만들어서 친구들에게 보여 주세요!\n\n채집하며 놀자!\n낚시하기? 아니면 곤충잡기? 바다에서, 연못에서 그리고 캠핑장에서 채집할 수 있는 것들이 가득! 직접 채집한 것들은 판매하거나 친구에게 자랑할 수도 있어요!\n\n펫과 함께 놀자!\n언제나 내 뒤를 졸졸 따라다니는 너무나도 귀여운 펫! 원하는 것을 들어주면 펫이 쑥쑥 자라나요! 다양한 종류의 펫과 함께 즐거운 시간을 보내 보세요!\n\n친구들아 모여라, 함께 놀자!\n전세계 누구든지 플레이투게더에서는 모두 친구! 친구들을 집에 초대해서 파티를 열거나 미니 게임을 같이 즐겨 보세요! 같이 하면 즐거움 100배!\n\n[스마트폰 앱 접근권한 안내]\n앱 이용 시 아래와 같은 서비스를 제공하기 위해 접근 권한을 요청하고 있습니다. \n필수적 접근권한 철회 시 리소스 중단 혹은 게임 접속 불가 현상이 발생할 수 있습니다.\n\n- 필수적 접근권한\n기기 사진/미디어/파일 엑세스 : 게임 실행 관련 파일 저장과 플레이 동영상/스크린샷 저장 시 사용합니다.\n알림 : 게임 서비스와 관련된 알림을 게시하도록 허용합니다.\n\n- 선택적 접근권한\n알림 : 해당 게임에 대한 정보성 메시지를 받기 위한 권한입니다.\n*선택적 접근권한의 허용에 동의하지 않아도 게임 서비스의 이용이 가능합니다.\n\n- 접근권한 철회 방법\n 설정 > 개인정보보호 > 해당 접근권한 선택 > 접근권한 동의 또는 철회 선택\n\n[주의사항]\n* 이 게임은 부분 유료 아이템 구매가 가능합니다. 부분 유료 아이템 구매시 추가 비용이 발생할 수 있으며, 아이템 종류에 따라 청약철회가 제한될 수도 있습니다. \n* 이 게임의 이용과 관련된 조건(계약해지/청약철회 등)은 게임 내 이용약관에서 확인하실 수 있습니다.\n\n※ 불법 프로그램 사용, 앱 변조, 기타 비정상적인 방법을 통해 게임을 이용할 경우, 이용 약관에 의거하여 서비스 제한, 계정 및 관련 정보 삭제, 손해배상 청구 등의 조치를 취할 수 있습니다.\n\n- 공식 네이버 카페: https://cafe.naver.com/playtogethergame\n- 공식 페이스북: https://www.facebook.com/PlayTogetherGame/\n- 게임관련 문의: support@playtogether.zendesk.com\n\n\n구독형 상품의 안내 - 플러스 멤버십 월정액($4.99)\n본 상품은 1개월 후 자동으로 갱신이 됩니다\n본 상품은 유효기간 종료일 24시간 이전에 해지하지 않으면 자동갱신 됩니다\n구독 취소 후에도 이용 기간까지는 멤버십의 혜택을 이용할 수 있습니다\n해당 상품은 구매 즉시 사용한 것으로 간주되어 청약철회가 불가능 합니다.\n구독형 상품의 해지\n구독 기간이 만료되기 최소 24시간 전에 자동 연장 결제를 해지해야 합니다\n해지 했을 때 이용기간이 남아 있더라도 그 부분에 대한 환불은 이루어지지 않습니다\n신용 카드의 유효 기간 만료 및 잔액 부족 등으로 인해 자동 갱신이 되지 않을 경우 구독이 취소됩니다\n해지의 순서\n구독형 상품의 해지는 마켓의 설정에서 가능합니다\n\n이용약관 - https://www.haegin.kr/management_view.php?type=ToS&ca_name=KOR"
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3b/5b/c5/3b5bc5b9-8e7b-e13f-ca9b-3761ef4fe50b/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg"), 
                    appName: "위버스 - webus",
                    appDescription: "누구나 동등하게 버스를 이용할 수 있도록 지원합니다.\n\n1. 저상버스 탑승요청 : 어디서 타고, 내리는지 기사님께 미리 알려주세요.\n2. 저상버스 경로검색 : 최신 업데이트 정보로, 최적의 경로를 알려드려요.\n3. 저상버스 알림기능 : 저상버스가 언제오는지 실시간으로 알려드려요."
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/09/7e/26/097e2658-b287-00ef-60ed-2a3cc5a82270/AppIcon-0-0-1x_U007emarketing-0-7-0-0-85-220.png/60x60bb.jpg"),
                    appName: "떠나다 - 당장 어디든 여행을 떠나고 싶을 땐?",
                    appDescription: "[ 주요기능 ]\n\n▶ 빠르게 떠나보세요!\n선택하신 장소에서 현재 시간 기준 가장 빨리 출발하는 여행지(교통편)중 하나를 랜덤으로 골라드립니다\n\n▶ 교통편을 선택해보세요!\n- 시외버스\n- 고속버스\n- 지하철 (추가 예정)\n- 기차 (추가 예정)\n- 비행기 (추가 예정)"
                )
            ]
        )
    }
}
#endif
