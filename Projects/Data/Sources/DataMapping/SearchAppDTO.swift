//
//  SearchAppDTO.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

struct SearchAppDTO: Codable {
    let resultCount: Int
    let results: [SearchResult]
}

extension SearchAppDTO {
    func toAppMinimun() -> [SearchAppMinResponse] {
        results.map { dto in
            .init(
                iconUrl: dto.artworkUrl60,
                appName: dto.trackName,
                appDescription: dto.description
            )
        }
    }
}

extension SearchAppDTO {
    struct SearchResult: Codable {
        /// 앱 ID
        let trackId: Int
        /// 앱 이름
        let trackName: String
        /// 앱 상세 설명
        let description: String
        /// 앱 스크린샷 URL들
        let screenshotUrls: [URL]
        /// 주의사항
        let advisories: [String]
        /// 지원되는 기기들
        let supportedDevices: [String]
        
        /// 초기 출시일
        let releaseDate: String
        /// 최근 릴리즈 노트
        let releaseNotes: String?
        /// 최근 업데이트일
        let currentVersionReleaseDate: String
        /// 최신 버전
        let version: String
        
        /// 개발자 이름
        let artistName: String
        /// 앱 장르들
        let genres: [String]
        /// 앱 링크
        let trackViewUrl: String?
        
        /// 사용 연령
        let contentAdvisoryRating: String
        /// 평가 평균 별점
        let averageUserRating: Double
        /// 평가 갯수
        let userRatingCount: Int
        
        /// 60x60 로고 URL
        let artworkUrl60: URL?
        /// 100x100 로고 URL
        let artworkUrl100: URL?
        /// 512x512 로고 URL
        let artworkUrl512: URL
        
        /// 파일 사이즈 바이트
        let fileSizeBytes: String

        /// 지원 언어들의 코드 ("EN", "KO"...)
        let languageCodesISO2A: [String]?
    }
}
