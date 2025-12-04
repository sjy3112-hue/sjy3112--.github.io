# GitHub 웹 에디터로 테마 커스터마이징하기 (초보자용 가이드)

이 가이드는 GitHub 웹사이트에서 직접 파일을 편집하여 이력서 테마를 커스터마이징하는 방법을 설명합니다.

## 🚀 빠른 시작 (3단계)

### 1단계: GitHub 저장소 접속
1. [GitHub.com](https://github.com)에 로그인
2. 본인의 저장소(`sjy3112--.github.io`)로 이동
3. 파일 목록 확인

### 2단계: `_config.yml` 파일 수정
1. 저장소에서 **`_config.yml`** 파일 클릭
2. 오른쪽 상단의 **✏️ 연필 아이콘** 클릭 (Edit this file)
3. 아래 항목들을 찾아서 본인 정보로 수정:

#### 필수 수정 항목:
```yaml
name: song ji yeon          → 본인 이름으로 변경
title: Your job title       → 본인의 직책으로 변경
email: Your email           → 본인 이메일로 변경
```

#### 소셜 미디어 링크 (원하는 것만):
```yaml
github_username: jekyll     → 본인 GitHub 사용자명으로 변경
linkedin_username: jekyll   → 본인 LinkedIn 사용자명으로 변경
twitter_username: jekyllrb  → 본인 Twitter 사용자명으로 변경
```

#### 자기소개:
- `about_profile_image:` 줄 찾기 → 프로필 이미지 경로 설정 (예: `images/profile.jpg`)
- `about_content:` 아래 내용을 본인 소개로 변경

4. 스크롤 내려서 **"Commit changes"** 버튼 클릭
5. 변경사항 설명 입력 (예: "개인 정보 업데이트")
6. **"Commit changes"** 버튼 클릭

### 3단계: 변경사항 확인
1. 커밋 후 1-2분 대기 (GitHub Pages 자동 빌드)
2. 브라우저에서 `https://[본인사용자명].github.io` 접속
3. 변경사항 확인

---

## 📝 상세 가이드

### 개인 정보 수정하기

`_config.yml` 파일에서 다음 항목들을 수정하세요:

```yaml
# Personal info 섹션
name: 본인 이름
title: 본인의 직책 (예: "Software Developer")
email: 본인 이메일
phone: 본인 전화번호 (선택사항)
website: 본인 웹사이트 (선택사항)
```

### 프로젝트/경력/학력 정보 수정하기

`_config.yml` 파일 하단의 `content:` 섹션을 찾아서 수정하세요:

#### Projects 섹션:
```yaml
- title: Projects
  layout: list
  content:
    - layout: left
      title: 프로젝트 이름        # 여기 수정
      sub_title: 프로젝트 설명     # 여기 수정
      caption: 2023 - 2024        # 기간 수정
      description: |
        프로젝트 상세 설명을 여기에 작성하세요
```

#### Experience 섹션:
```yaml
- title: Experience
  layout: list
  content:
    - layout: right
      title: 회사명              # 여기 수정
      sub_title: 직책            # 여기 수정
      caption: 2020 - 2023       # 기간 수정
      description: |
        업무 내용을 여기에 작성하세요
```

#### Education 섹션:
```yaml
- title: Education
  layout: list
  content:
    - layout: top-right
      title: 학교명              # 여기 수정
      sub_title: 학위            # 여기 수정
      caption: 2016 - 2020      # 기간 수정
      description: |
        학위/과정 설명을 여기에 작성하세요
```

### 프로필 이미지 추가하기

1. 저장소에서 **`images`** 폴더로 이동
2. **"Add file"** > **"Upload files"** 클릭
3. 프로필 사진 업로드 (권장: 200x200px, JPG 또는 PNG)
4. `_config.yml`에서 `about_profile_image: images/업로드한파일명.jpg` 설정

### 색상 변경하기 (선택사항)

1. **`assets/main.scss`** 파일 열기
2. 편집 모드로 전환
3. 파일 끝에 있는 주석 처리된 예시 코드를 참고하여 원하는 스타일 추가
4. 예시:
```scss
/* 색상 변경 예시 */
a {
  color: #477dca;  /* 링크 색상 (원하는 색상으로 변경) */
}

h3 {
  border-bottom-color: #CCCCCC;  /* 섹션 제목 아래 선 색상 */
}
```
5. 색상 코드는 [HTML Color Codes](https://htmlcolorcodes.com/)에서 찾을 수 있습니다

### 다크 모드 켜기/끄기

`_config.yml` 파일에서:
```yaml
darkmode: true   # 항상 다크 모드
darkmode: false  # 사용자 기기 설정 따름 (기본값)
darkmode: never  # 다크 모드 사용 안 함
```

---

## ⚠️ 주의사항

1. **YAML 문법**: `_config.yml` 파일에서 **들여쓰기는 스페이스만 사용**하세요. 탭 사용 금지!
2. **자동 배포**: 파일 저장 후 GitHub Pages가 자동으로 빌드합니다 (1-5분 소요)
3. **변경사항 확인**: 저장소의 **Actions** 탭에서 빌드 상태 확인 가능
4. **브라우저 캐시**: 변경사항이 안 보이면 브라우저 캐시 삭제 (Ctrl+F5 또는 Cmd+Shift+R)

---

## 🔧 문제 해결

### 사이트가 업데이트되지 않음
- 10분 정도 기다려보세요
- 저장소 **Settings** > **Pages**에서 다시 저장

### 오류 발생
- `_config.yml` 파일의 문법 오류 확인 (들여쓰기, 콜론(:) 등)
- 저장소의 **Actions** 탭에서 빌드 오류 확인

### 변경사항이 반영되지 않음
- 브라우저 캐시 삭제 (Ctrl+F5 또는 Cmd+Shift+R)
- 시크릿 모드에서 확인

---

## 📚 더 알아보기

- [Jekyll 공식 문서](https://jekyllrb.com/docs/)
- [Markdown 가이드](https://www.markdownguide.org/)
- [Font Awesome 아이콘](https://fontawesome.com/icons?d=gallery&s=brands&m=free)
- [HTML 색상 코드](https://htmlcolorcodes.com/)

---

## 💡 팁

- 한 번에 하나씩 수정하고 커밋하는 것을 권장합니다
- 변경사항을 커밋할 때 명확한 설명을 작성하세요
- 프로필 이미지는 정사각형 비율이 가장 좋습니다
- Markdown 형식을 사용하면 텍스트를 더 예쁘게 꾸밀 수 있습니다

