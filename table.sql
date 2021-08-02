/* 계정 정보 */
CREATE TABLE `users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,-- 주키 
	
	`username` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,-- 사용자계정 
	`password` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,-- 사용자 비밀번호 
	`flag` int(11) NOT NULL DEFAULT 0,-- 사용자 권한 
	`darkmode` tinyint(1) NOT NULL DEFAULT 1,-- 다크모드 사용 여부 
	`department` VARCHAR(255) DEFAULT NULL,
	`responsibility` VARCHAR(255) DEFAULT NULL,
	
	`createdAt` datetime NOT NULL,
	`updatedAt` datetime NOT NULL,
	`deletedAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* LOG 기록 */
CREATE TABLE `log` (
	`id` int(11) NOT NULL AUTO_INCREMENT, -- 주키 
	`user_id` int(11) NOT NULL, -- 외래키
	
	`action` varchar(100) NOT NULL, -- 활동 
	`result` varchar(255) NOT NULL, -- 결과 
	`path` TEXT NOT NULL, -- 접근 경로 
	`message` TEXT NOT NULL, -- 메세지 
	`ip` INT UNSIGNED NOT NULL, -- IP 주
	
	`createdAt` datetime NOT NULL,
	`updatedAt` datetime NOT NULL,
	`deletedAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* 부적합 발생 및 개선대책 현황 리스트 */
CREATE TABLE `improvement_list` (
	`id` int(11) NOT NULL AUTO_INCREMENT, -- 주키 
	`user_id` int(11) NOT NULL, -- 외래키 
	
	`title` VARCHAR(255) NOT NULL, -- 게시판 제목 
	
	`createdAt` datetime NOT NULL,
	`updatedAt` datetime NOT NULL,
	`deletedAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* 부적합 발생 및 개선대책 현황 피드 */
CREATE TABLE `improvement_feed` (
	`id` int(11) NOT NULL AUTO_INCREMENT, -- 주키 
	`user_id` int(11) NOT NULL, -- 외래키 
	
	`defect_status` ENUM('미결','진행중','완료'), -- 불량현황 
	`defect_status_reason` VARCHAR(255) NOT NULL, -- 불량현황 사유 
	`defect_status_info` TEXT NOT NULL, -- 불량 상세내용 
	`date` datetime NOT NULL, -- 발생일자 
	`client_company` VARCHAR(255) DEFAULT NULL, -- 고객사 
	`management_number` VARCHAR(255) DEFAULT NULL, -- 관리번호 
	`imputable_department` VARCHAR(255) DEFAULT NULL, -- 귀책부서 
	`imputable_type` VARCHAR(255) DEFAULT NULL, -- 귀책구분 
	`worker_name` VARCHAR(100) DEFAULT NULL, -- 작업자 명 
	`message` TEXT DEFAULT NULL, -- 비고 
	`img` TEXT DEFAULT NULL, -- 이미지 
	`action_points` TEXT DEFAULT NULL, -- 조치사항 
	`causes_of_occurrence` TEXT DEFAULT NULL, -- 발생원인 
	`measures_to_prevent_recurrence` TEXT DEFAULT NULL, -- 재발방지대책 
	
	`createdAt` datetime NOT NULL,
	`updatedAt` datetime NOT NULL,
	`deletedAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
