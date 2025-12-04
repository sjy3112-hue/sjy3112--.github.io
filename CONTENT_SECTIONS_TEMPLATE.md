# 섹션 추가/수정 가이드

이 레포지토리는 `_config.yml` 파일 하나로 이력서의 모든 콘텐츠를 제어합니다.  
아래 템플릿을 복사해 붙여넣으면 손쉽게 새 섹션이나 항목을 추가할 수 있습니다.

---

## 1. 새 섹션 추가

```yaml
# content 배열 맨 아래에 붙여넣고 값만 변경하세요
- title: 새 섹션 제목
  layout: list          # list 또는 text
  content:
    - layout: left      # left/right/top/top-middle 등
      border: weak      # 필요 없으면 삭제
      title: 항목 제목
      sub_title: 보조 설명 (선택)
      caption: 기간/키워드 (선택)
      link: https://example.com (선택)
      link_text: 링크 버튼 라벨 (선택)
      description: |
        실제 내용을 여기에 Markdown으로 작성합니다.
```

`layout: text` 를 사용할 경우 `content: |` 아래에 자유롭게 Markdown을 입력하면 됩니다.

---

## 2. 프로젝트 PDF 슬롯 복제

```yaml
- layout: left
  border: weak
  title: 프로젝트 이름
  link: /assets/docs/my-project.pdf
  link_text: PDF 다운로드
  description: |
    - 프로젝트 목표
    - 사용 기술
    - 나의 역할
```

PDF 파일은 `assets/docs/` 폴더에 넣으면 브라우저에서 바로 다운로드할 수 있습니다.  
임시 파일이 필요하면 `scripts/generate_placeholder_pdf.ps1` 스크립트를 실행하세요.

---

## 3. 빠르게 텍스트만 교체하고 싶을 때

1. `_config.yml`에서 원하는 섹션을 찾습니다.
2. `description` 또는 `content` 블록 안의 문장을 직접 수정합니다.
3. `git add _config.yml && git commit -m "Update resume content"` 후 `git push`로 배포합니다.

필요할 때 이 파일도 업데이트해 개인 템플릿을 쌓아두세요.

