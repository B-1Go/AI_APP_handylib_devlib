<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/osamhack2021/AI_APP_handylib_devlib">
    <img src="images/logo.ico" alt="Logo" width="80" height="80">
  </a>

![license](https://img.shields.io/github/license/osamhack2021/AI_APP_handylib_devlib.svg)
![repo size in bytes](https://img.shields.io/github/repo-size/osamhack2021/AI_APP_handylib_devlib.svg)
![GitHub contributors](https://img.shields.io/github/contributors/osamhack2021/AI_APP_handylib_devlib.svg)
![GitHub commit](https://img.shields.io/github/last-commit/osamhack2021/AI_APP_handylib_devlib.svg)
![GitHub commit interval](https://img.shields.io/github/commit-activity/w/osamhack2021/AI_APP_handylib_devlib.svg)

  <h3 align="center">내 손 안의 진중문고, HandyLib</h3>

  <p align="center">
    진중문고를 내 손안으로!
    <br />
    <a href="https://humdrum-anise-0dc.notion.site/DevLib-0960a793aa544b2bbc3038d309ad2c47"><strong>[ 개발문서 보기 ]</strong></a>
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>[ 데모버전 ]</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->

## Readme 목차

  <ol>
    <li>
      <a href="#프로젝트-요약">프로젝트 요약</a>
      <ul>
        <li><a href="#개발-도구">개발 도구</a></li>
      </ul>
    </li>
    <li>
      <a href="#분야별-설명요약">분야별 설명요약</a>
      <ul>
        <li><a href="#프론트엔드">프론트엔드(flutter)</a></li>
        <li><a href="#백엔드">백엔드(flask)</a></li>
        <li><a href="#추천알고리즘">추천알고리즘(NNE)</a></li>
      </ul>
    </li>
    <li><a href="#사용법">사용법</a></li>
    <ul>
        <li><a href="#설치">설치</a></li>
        <li><a href="#어플리케이션-사용법">어플리케이션 사용법</a></li>
      </ul>
    <li><a href="#라이센스">라이센스</a></li>
    <li><a href="#개발자-정보">개발자 정보</a></li>
  </ol>

<!-- ABOUT THE PROJECT -->
<br/>

## 프로젝트 요약

<img src="images/sample.png" alt="Logo" height=800>
</br>
'내 손안의 진중문고'는 진중(陣中)에 위치한 손 안의 도서관이라는 뜻으로, 현재 각 군부대에 위치한 북카페/도서관을 현역 군인들이 보다 손쉽게 사용할 수 있도록 어플리케이션으로 만들어졌습니다.

'내 손안의 진중문고'는 다음과 같은 장점이 있습니다:

- 인공지능 추천 알고리즘을 통한 도서 추천으로 사용자의 독서를 장려할 수 있습니다.
- 오픈소스 모바일/웹/데스크톱 크로스 플랫폼 SDK인 flutter를 이용하여 프론트엔드를 개발하여 확장성이 뛰어납니다.
- 어플리케이션으로 개발되어 접근성이 뛰어납니다.
- 부대의 북카페/도서관에 있는 도서들의 추적&관리가 용이합니다.

이상의 특장점은 각 군마다 존재한 기존의 전자책 도서관의 단점과 부대별로 상이한 북카페 관리 체계의 단점을 보완하고 장병 복지와 자기계발에 큰 기여를 하고 있는 진중문고의 외부유출 및 유통 문제를 해결하고 양질의 도서를 보다 좋은 접근성으로 제공하여 줍니다.

### - 개발 도구

- [python](https://www.python.org/)
- [flutter](https://flutter-ko.dev/)
- [flask](https://flask.palletsprojects.com/en/2.0.x/)
<br/><br/>
<!-- GETTING STARTED -->

## 분야별 설명요약

---

### - 프론트엔드

크로스 플랫폼 SDK인 flutter을 이용하여 어플리케이션을 개발하였습니다. 로그인/회원가입 기능으로 어플리케이션을 개인화였고, 도서 추천, 나의 서재, 부대 도서관, 게시판, 개인정보 수정 기능을 가지고 있습니다.<br/>
자세한 내용은 이하의 앱의 [Readme](https://github.com/osamhack2021/AI_APP_handylib_devlib/tree/main/app)를 참고해주세요.

---

### - 백엔드

Python의 웹 프레임워크 중 하나인 Flask를 이용하여 어플리케이션의 요청을 처리하는 REST API를 개발하였습니다. 어플리케이션에 정보 저장에 필요한 데이터베이스는 Mongodb를 이용하였고 apache를 이용하여 서버를 자동화하였습니다.<br/>
자세한 내용은 이하의 백엔드의 [Readme](https://github.com/osamhack2021/AI_APP_handylib_devlib/tree/main/python_flask)를 참고해주세요.

---

### - 추천알고리즘

collaborative filtering 중 하나인 matrix factorization을 이용하여 추천시스템을 개발하였습니다. 신규사용자에겐 도서 이용 기록등이 없으므로 전체 책 중 무작위로 추천리스트가 제공되고, 사용자가 좋아하는 도서에 좋아요를 누르면 매일 밤 21시 추천점수가 업데이트되어 맞춤형 도서를 추천받을 수 있습니다.<br/>
자세한 내용은 AI의 [Readme](https://github.com/osamhack2021/AI_APP_handylib_devlib/tree/main/recommendation)를 참고해주세요.

</br>

## 사용법

사용자는 안드로이드/ios 스마트폰을 이용하여 어플리케이션을 설치하여 기능을 사용할 수 있습니다. 현재는 ios 빌드가 유료인 관계로 안드로이드만을 지원하며, 추후 ios빌드를 제공할 계획입니다.

### 설치

1. 다음 링크에서 어플리케이션을 다운받으세요. [https://example.com](https://example.com)
2. 어플리케이션을 설치해 주세요.

3. 어플리케이션의 권한을 설정해 주세요.

각 기능별 개발을 위한 설치방법은 기능별 README를 참고해주세요.

<!-- USAGE EXAMPLES -->

### 어플리케이션 사용법

개발이 완료된 후 이미지가 추가 될 예정입니다.

<!-- LICENSE -->

## 라이센스

MIT라이센스가 적용되었습니다. `LICENSE` 파일을 통해 확인할 수 있습니다. 프로젝트에 사용된 오픈소스 라이브러리에 대한 라이센스는 `DEPENDENCIES` 파일을 통해 확인해주세요.

<!-- CONTACT -->

## 개발자 정보

김민준 - mamy0320@naver.com</br>
홍지환 - eat333@naver.com </br>
김수민 - kdg97811@naver.com</br>
고명진 - mj2000go@naver.com</br>
김승하 - kstream35@gmail.com</br>

군장병 온라인 해커톤: [https://osam.kr/home](https://osam.kr/home)
