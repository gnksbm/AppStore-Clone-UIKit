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
final class MockApplicationRepository: SearchAppRepository {
    func searchApp(
        request: SearchAppRequest
    ) -> Observable<[SearchAppMinResponse]> {
        .just(
            [
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/6b/38/75/6b38752f-71da-9424-89d1-07ac92dde54f/AppIcon-1x_U007ephone-85-220.png/60x60bb.jpg"), 
                    appID: 0,
                    appName: "버스어디: 실시간 버스, 정기 알람, 즐겨찾기",
                    appDescription: "◆ 서울 버스가 내 손 안에!\n서울시의 실시간 버스정보 확인이 가능합니다.\n\n◆ 자주 이용하는 버스 도착 전, 확인하고 싶다면!\n자주 이용하는 버스가 있다면, 즐겨찾기로 저장 후 첫 화면에서 바로 확인할 수 있습니다.\n\n◆ 정기알람으로 매일 출퇴근 길을 편안하게!\n정기알람을 이용해 매일 이용하는 버스가 현재 정류장에 도착하기 몇 분 전인지 확인해보세요.\n\n\n[서비스 접근 권한 안내]\n▸ 선택 접근 권한\n위치 : 주변 버스 정류장 조회\n알람 : 사운드 및 아이콘 배지로 스케줄알람 제공\n\n\n[고객센터]\n- 메일 : exok1and1m@gmail.com\n- 홈페이지 : https://buscoming.tistory.com"
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/ca/ee/c3/caeec33a-1383-afb9-3cfb-a89a915c3041/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg"),
                    appID: 0,
                    appName: "플레이투게더 (Play Together)",
                    appDescription: "언제 어디서나, 일단 놀자!\n플레이투게더에서는 모든 곳이 놀이터! 내 마음대로 꾸미고, 친구들과 이야기하며, 질릴 때까지 놀 수 있어요! 언제 어디서나, 일단 놀자!\n\n게임하며 놀자!\n오늘은 어떤 게임을 하고 놀까?! 달리기 레이스? 좀비 바이러스? 배틀로얄? 전세계 친구들과 스릴 넘치는 다양한 미니 게임을 즐겨 보세요!\n\n집 꾸미며 놀자!\n개성 넘치는 가구들로 상상만하던 집을 직접 꾸밀 수 있다고?! 멋지고~ 귀엽고! 이상한? 나만의 집을 만들어서 친구들을 초대해 보세요!\n\n뭘 입고 놀까?\n기분에 따라, 분위기에 따라 마음대로 옷을 바꿔 입어 볼까? 개성이 넘치는 나만의 캐릭터를 만들어서 친구들에게 보여 주세요!\n\n채집하며 놀자!\n낚시하기? 아니면 곤충잡기? 바다에서, 연못에서 그리고 캠핑장에서 채집할 수 있는 것들이 가득! 직접 채집한 것들은 판매하거나 친구에게 자랑할 수도 있어요!\n\n펫과 함께 놀자!\n언제나 내 뒤를 졸졸 따라다니는 너무나도 귀여운 펫! 원하는 것을 들어주면 펫이 쑥쑥 자라나요! 다양한 종류의 펫과 함께 즐거운 시간을 보내 보세요!\n\n친구들아 모여라, 함께 놀자!\n전세계 누구든지 플레이투게더에서는 모두 친구! 친구들을 집에 초대해서 파티를 열거나 미니 게임을 같이 즐겨 보세요! 같이 하면 즐거움 100배!\n\n[스마트폰 앱 접근권한 안내]\n앱 이용 시 아래와 같은 서비스를 제공하기 위해 접근 권한을 요청하고 있습니다. \n필수적 접근권한 철회 시 리소스 중단 혹은 게임 접속 불가 현상이 발생할 수 있습니다.\n\n- 필수적 접근권한\n기기 사진/미디어/파일 엑세스 : 게임 실행 관련 파일 저장과 플레이 동영상/스크린샷 저장 시 사용합니다.\n알림 : 게임 서비스와 관련된 알림을 게시하도록 허용합니다.\n\n- 선택적 접근권한\n알림 : 해당 게임에 대한 정보성 메시지를 받기 위한 권한입니다.\n*선택적 접근권한의 허용에 동의하지 않아도 게임 서비스의 이용이 가능합니다.\n\n- 접근권한 철회 방법\n 설정 > 개인정보보호 > 해당 접근권한 선택 > 접근권한 동의 또는 철회 선택\n\n[주의사항]\n* 이 게임은 부분 유료 아이템 구매가 가능합니다. 부분 유료 아이템 구매시 추가 비용이 발생할 수 있으며, 아이템 종류에 따라 청약철회가 제한될 수도 있습니다. \n* 이 게임의 이용과 관련된 조건(계약해지/청약철회 등)은 게임 내 이용약관에서 확인하실 수 있습니다.\n\n※ 불법 프로그램 사용, 앱 변조, 기타 비정상적인 방법을 통해 게임을 이용할 경우, 이용 약관에 의거하여 서비스 제한, 계정 및 관련 정보 삭제, 손해배상 청구 등의 조치를 취할 수 있습니다.\n\n- 공식 네이버 카페: https://cafe.naver.com/playtogethergame\n- 공식 페이스북: https://www.facebook.com/PlayTogetherGame/\n- 게임관련 문의: support@playtogether.zendesk.com\n\n\n구독형 상품의 안내 - 플러스 멤버십 월정액($4.99)\n본 상품은 1개월 후 자동으로 갱신이 됩니다\n본 상품은 유효기간 종료일 24시간 이전에 해지하지 않으면 자동갱신 됩니다\n구독 취소 후에도 이용 기간까지는 멤버십의 혜택을 이용할 수 있습니다\n해당 상품은 구매 즉시 사용한 것으로 간주되어 청약철회가 불가능 합니다.\n구독형 상품의 해지\n구독 기간이 만료되기 최소 24시간 전에 자동 연장 결제를 해지해야 합니다\n해지 했을 때 이용기간이 남아 있더라도 그 부분에 대한 환불은 이루어지지 않습니다\n신용 카드의 유효 기간 만료 및 잔액 부족 등으로 인해 자동 갱신이 되지 않을 경우 구독이 취소됩니다\n해지의 순서\n구독형 상품의 해지는 마켓의 설정에서 가능합니다\n\n이용약관 - https://www.haegin.kr/management_view.php?type=ToS&ca_name=KOR"
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3b/5b/c5/3b5bc5b9-8e7b-e13f-ca9b-3761ef4fe50b/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg"),
                    appID: 0,
                    appName: "위버스 - webus",
                    appDescription: "누구나 동등하게 버스를 이용할 수 있도록 지원합니다.\n\n1. 저상버스 탑승요청 : 어디서 타고, 내리는지 기사님께 미리 알려주세요.\n2. 저상버스 경로검색 : 최신 업데이트 정보로, 최적의 경로를 알려드려요.\n3. 저상버스 알림기능 : 저상버스가 언제오는지 실시간으로 알려드려요."
                ),
                SearchAppMinResponse(
                    iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/09/7e/26/097e2658-b287-00ef-60ed-2a3cc5a82270/AppIcon-0-0-1x_U007emarketing-0-7-0-0-85-220.png/60x60bb.jpg"),
                    appID: 0,
                    appName: "떠나다 - 당장 어디든 여행을 떠나고 싶을 땐?",
                    appDescription: "[ 주요기능 ]\n\n▶ 빠르게 떠나보세요!\n선택하신 장소에서 현재 시간 기준 가장 빨리 출발하는 여행지(교통편)중 하나를 랜덤으로 골라드립니다\n\n▶ 교통편을 선택해보세요!\n- 시외버스\n- 고속버스\n- 지하철 (추가 예정)\n- 기차 (추가 예정)\n- 비행기 (추가 예정)"
                )
            ]
        )
    }
    func searchApp(
        request: SearchAppRequest
    ) -> Observable<[SearchAppMidResponse]> {
        .just(
            [
                SearchAppMidResponse(
                    minResponse: .init(
                        iconUrl: URL(string:  "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/d0/f9/ff/d0f9ffc9-5ee5-89cc-d74b-7959bda0a9a2/AppIcon-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg"),
                        appID: 0,
                        appName: "짤칵(ZZAL KAK)",
                        appDescription: "[앱정보]\nAR 포토 짤칵과 함께 살아 움직이는 마법같은 사진을 경험해보세요!\n\n▶ 짤칵 AR 포토로 살아 움직이는 사진을 경험해 보세요! \nAR 포토존 짤칵에서 사진과 영상을 찍어 사진을 출력하고, \n짤칵 앱에서 스캔하면 숨겨진 영상과 콘텐츠를 즐길 수 있어요!\n\n▶ 스캔한 영상을 저장하고, 공유할 수 있어요!\n내가 찍은 짤칵 포토를 휴대폰에 저장하고, SNS로 공유해보세요!\n\n\n▶ 짤칵 AR 포토만의 특별한 기능을 즐겨보세요!\n이벤트 카드의 뒷면을 비춰, 스포츠 스타의 숨겨진 영상을 확인하고 AR버튼을 경험해보세요! AR버튼을 통해 원하는 SNS로 연결할 수 있습니다.\n\n[문의]\n- AR 포토 구매: https://smartstore.naver.com/zzalkak\n- AR 포토 문의: http://pf.kakao.com/_dYBSK\n- 웹사이트: https://zzalkak.com/\n- 인스타그램: https://www.instagram.com/zzalkak/\n\n[참고]\n- 이벤트 문의: visoft.sw@gmail.com, 0269536916"
                    ),
                    averageRating: 3.58824,
                    ratingCount: 17,
                    developerName: "VISOFT Ltd.",
                    genre: Optional("사진 및 비디오"),
                    screenshotUrls: [
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/e6/fe/72/e6fe72c4-8ed2-739d-4fe1-c8794956b6f8/80db902a-cc2f-4fee-9508-b15174d5e446_5.5_U1112_U1167_U11bc_2p.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/2a/0d/e3/2a0de315-51d7-2f94-5874-942df30bf8c0/7a3d1373-0233-4fe3-80d5-a7c59b0aed06_5.5_U1112_U1167_U11bc_3p.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/d0/7b/da/d07bdac8-365f-f447-e8c6-6552ac9584f8/f0957280-9b87-4442-bdc4-7f6b1a045fa2_5.5_U1112_U1167_U11bc_4p.png/392x696bb.png")!
                    ]
                ),
                SearchAppMidResponse(
                    minResponse: .init(
                        iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple49/v4/65/ce/52/65ce52f9-a6cc-bfdb-d5a9-cadc6fd34d96/pr_source.png/60x60bb.jpg"),
                        appID: 0,
                        appName: "Lagu Anak Kak Zepe 1",
                        appDescription: "Halo Anak Indonesia..!!\n\nSiapa yang suka menyanyi? Pasti semua anak Indonesia suka menyanyi kan? Kali ini Kolak ingin mengajak semua anak Indonesia untuk bernyanyi bersama. Lagu anak kali ini diciptakan oleh Kak ZEPE. Ada 12 lagu yang menarik dan asyik dinyanyikan. Sekali mendengar, kalian pasti bisa menirukannya. KOLAK juga dilengkapi dengan gambar dan animasi yang menarik sehingga anak-anak tidak akan bosan dan terus tertarik untuk belajar bernyanyi. Ayo kita intip lagu apa saja yang ada:\n\nDaftar Lagu Anak\n=============\n01. Kebun Binatang\n02. Kaki Hewan\n03. Buaya\n04. Binatang Nocturnal\n05. Sifat Air\n06. Bunga Mawar Yang Indah\n07. Bagian Pohon\n08. Akulah Matahari\n09. Ciptaan Tuhan\n10. Sebanyak Bintang di Langit\n11. Senyuman Sedekah Sederhana\n12. Asyiknya Bersekolah\n\nLagu Anak ciptaan Kak Zepe ini berisi tentang indahnya alam dan mengenal dunia hewan. Diharapkan dengan adanya lagu ini, anak-anak dapat belajar mengenal alam yang bervariasi dan sangat indah untuk dijaga. Kemudian anak-anak juga dikenalkan dengan berbagai macam hewan seperti buaya, binatang nocturnal dan masih banyak yang lainnya.\n\nTENTANG KOLAK\n---------------------\nKOLAK adalah aplikasi yang berisi lagu-lagu anak. Baik itu Lagu Anak Indonesia populer, Lagu Anak Dunia ataupun Lagu Anak Ciptaan sendiri. Lagu Anak dikeluarkan berseri secara rutin oleh Educa Studio. Setiap seri pasti dilengkapi dengan animasi yang menarik serta narasi yang bisa membantu anak-anak yang belum lancar membaca.\n\nTENTANG KAK ZEPE\n-------------------------\nZ. P Heru Budhianto. K. P S.S atau yang akrab disapa Kak Zepe lahir di kota gudeg, Jogja. Pernah mengajar di sekolah Taman Kanak-kanak Tunas Gading Jakarta selama satu tahun dan Sekolah Dasar Berstandard Internasional Saint Peter Jakarta sebagai guru bahasa Inggris selama dua tahun. Saat ini Kak Zepe aktif mengajar di Top Training Centre, sebagai guru Bahasa Inggris tingkat TK, SD, SMP, SMA, dan mahasiswa. Lebih dari 500 lagu yang telah Kak Zepe ciptakan untuk anak Indonesia. \n\nKami mengharapkan kritik dan saran dari anda, jangan ragu untuk mengirimkannya ke :\nEmail: support@educastudio.com\n\nInfo lebih lanjut KOLAK:\nWebsite: http://www.educastudio.com\nFacebook: https://www.facebook.com/educastudio\nTwitter: @educastudio\n\nBagi bunda yang suka menemani anak-anak bermain dan bernyanyi, tak ada salahnya mencoba aplikasi KOLAK. Anak-anak tak hanya mendapatkan kesenangan dalam bermain, namun juga ilmu yang bermanfaat. Belajar sambil bermain..?? Kenapa tidak..?? Ayoo kita temani anak-anak bernyanyi, bersama KOLAK tentunya.. :)"
                    ),
                    averageRating: 0.0,
                    ratingCount: 0,
                    developerName: "EDUCA SISFOMEDIA INDONESIA, CV",
                    genre: Optional("교육"),
                    screenshotUrls: [
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple69/v4/2b/a4/a9/2ba4a9b3-b107-5596-1ef9-acf183d4cd82/pr_source.png/406x228bb.png")!
                        ,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple49/v4/e9/7e/af/e97eaf26-ddc3-6d98-29ad-6044a7c44633/pr_source.png/406x228bb.png")!
                        ,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple69/v4/4d/83/64/4d8364c9-8732-00e9-dd6a-b20f88bdb1d7/pr_source.png/406x228bb.png")!
                        ,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple69/v4/6c/10/09/6c1009d3-ee12-5dc2-8b8f-3af1b9045844/pr_source.png/406x228bb.png")!
                        ,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple69/v4/21/ea/a2/21eaa26f-516b-1c6e-0f8b-c3ec81190882/pr_source.png/406x228bb.png")!
                    ]
                ),
                SearchAppMidResponse(
                    minResponse: .init(
                        iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/85/ff/36/85ff36ea-69da-f7e6-a71f-339312656ba9/mzl.jpdtcexj.png/60x60bb.jpg"),
                        appID: 0,
                        appName: "StreetKäk",
                        appDescription: "Streetkäk is the first and only app to locate Food trucks and other street food vendors in real time, in the Nordic countries as Sweden, Denmark, Norway and Finland.\n\nStreetkäk is the quickest and easiest way to discover high quality and delicious street food around you!\n\nStreetkäk features:\n\n- See where food trucks/street food vendors are serving in real time\n- See their locations and serving times for coming days\n- Order directly from app, pick it from truck without waiting\n- Check their menus and pictures\n- Find your favourite street food by searching with hashtags & keywords\n- Follow them on Facebook, Twitter & Instagram\n- Be informed of street food events in your city"
                    ),
                    averageRating: 0.0,
                    ratingCount: 0,
                    developerName: "Phone Card Dialler",
                    genre: Optional("음식 및 음료"),
                    screenshotUrls: [
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple111/v4/a3/b3/55/a3b355f0-1eb5-0c04-df77-910908f9a901/mzl.ltasnkbx.jpg/392x696bb.jpg")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple111/v4/41/9e/44/419e44dd-3785-37b6-e00c-b0c5f6ed956a/mzl.oeukbuae.jpg/392x696bb.jpg")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/17/a2/64/17a264d4-61bf-ac2b-70e5-7461f14a6625/mzl.zumrxono.jpg/392x696bb.jpg")!
                    ]
                ),
                SearchAppMidResponse(
                    minResponse: .init(
                        iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/a4/17/0f/a4170f09-82bb-0372-160b-1c559a50270c/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/60x60bb.jpg"),
                        appID: 0,
                        appName: "KAK-CIN Score",
                        appDescription: "Contrast-induced nephropathy (CIN) is defined as the impairment of renal function—measured as either a 25% increase in serum creatinine(SCr) from baseline or a 0.5 mg/dL(44 µmol/L) increase in absolute SCr value—within 48-72 hours after intravenous contrast administration.\n\nIt is called: Kulkarni-Almeida-Kothari(KAK) CIN Score\n\n\nDISCLAIMER : This app helps you in finding your Nephrology risk score. Please seek nephrologist\'s advice in addition to using this app before making any medical decisions and taking any medicines."
                    ),
                    averageRating: 0.0,
                    ratingCount: 0,
                    developerName: "Chaitanya Kulkarni",
                    genre: Optional("의료"),
                    screenshotUrls: [
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/b8/b5/fc/b8b5fca1-1a80-ff5e-1a87-2478b92c968c/accab0b2-c249-4eb4-a77f-58c4c521b6aa_iphone55_1.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/cf/2d/f1/cf2df1f1-1b17-72d3-dac3-6cf3256a4b0d/5fd5b991-4526-4750-8bbd-b914882d3e51_iphone55_2.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/91/50/4e/91504eed-b1bc-1664-c07f-d3418c6395a7/cce80ecd-ec2a-4f72-9bf3-5e4cb4b50445_iphone55_3.png/392x696bb.png")!
                    ]
                ),
                SearchAppMidResponse(
                    minResponse: .init(
                        iconUrl: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/b4/4b/dd/b44bdd1d-b435-bd29-d08e-70b29e996aa8/AppIcon-0-0-1x_U007emarketing-0-0-0-4-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/60x60bb.jpg"),
                        appID: 0,
                        appName: "Mitt Käk",
                        appDescription: "Att fylla på kroppen med rätt energier till lunch är viktigt för att orka resten av dagen. Detta vet de flesta om. I skolan har man oftast en varm rätt och en vegetarisk rätt att välja på och sen är utbudet slut. Vi kan med vår app Mitt Käk erbjuda er elever fler valmöjligheter i matsalen varje dag, möjlighet för er att ge oss direkt feedback på vad ni tyckte om maten, ni får bilder samt utförliga beskrivningar om varje rätt. Det enda ni behöver göra är att lägga er förhandsorder i appen en gång i veckan. Enkelt!\n\nAppen har många fördelar för de som använder den, och en viktig funktion är att den har en positiv miljöpåverkan. Om eleven lägger en förhandsorder vet köket vad de ska leverera och svinnet, d.v.s att kasta överbliven mat, minskar. Sophanteringen är en av de saker som har den största negativa påverkan vår miljö.\n\nMålet är att ni elever ska känna att ni vill komma till matsalen för att det finns något som ni själva valt att äta. Bra lunch leder till högre måluppfyllelse på eftermiddagen, oavsett vad det är ni ägnar er åt. Det kan vara studier, träning eller andra aktiviteter. Att hoppa över lunchen är ingen bra idé. Att gå ut på stan och behöva öppna sin egen plånbok när skolmaten är gratis, är inte heller speciellt kul.\n\nKontakta oss så hjälper vi er igång med appen!\n\nhej@mittkak.nu"
                    ),
                    averageRating: 0.0,
                    ratingCount: 0,
                    developerName: "Såni Innovation AB",
                    genre: Optional("음식 및 음료"),
                    screenshotUrls: [
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/a7/cb/9f/a7cb9f00-0fc6-b17e-c336-2d0c89c5de60/pr_source.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/31/e4/06/31e4067d-92b9-c66c-9c06-a89af9a2ed7d/pr_source.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/fe/b4/db/feb4db57-ed26-4d66-a7cc-63b8f316591d/pr_source.png/392x696bb.png")!,
                        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/ef/5d/61/ef5d61cb-b96d-4afa-36fb-2436101480f0/pr_source.png/392x696bb.png")!
                    ]
                )
            ]
        )
    }
}
#endif
