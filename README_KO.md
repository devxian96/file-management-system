# file-management-system
> 가볍고, 현대적이며, 진보한 ERP 시스템.   
> NuxtJS Front-End.   
> Vuetify Design Framework.   
> phpExpress Back-End.   
> phpSequelize ORM.
## 빌드 설정

```bash
# 디펜던시 설치
$ yarn install

# localhost:3000으로 프론트 핫 리로드 서버 실행
$ yarn dev

# 정적 프로젝트 생성
$ yarn build
$ yarn generate

# localhost:4000으로 백 핫 리로드 서버 실행
$ yarn back
```

작동 방식에 대한 자세한 설명은 [문서]](https://nuxtjs.org)을 참조하십시오.

***
## 특수 디렉토리
다음과 같은 추가 디렉터리를 만들 수 있으며 이 중 일부는 특수 동작을 수행합니다. 'pages'만 필요합니다. 기능을 사용하지 않으려면 삭제할 수 있습니다.

### `assets`
assets 디렉토리에는 Stylus 또는 Sass 파일, 이미지 또는 글꼴과 같은 컴파일되지 않은 assets이 포함됩니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/assets)에서 확인하십시오.

### `components`
components 디렉토리에는 Vue.js 구성 요소가 포함되어 있습니다. components는 페이지의 각기 다른 부분을 구성하며 페이지, 레이아웃 및 기타 구성요소로 재사용 및 가져올 수 있습니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/components)에서 확인하십시오.

### `layouts`
layouts은 사이드바를 포함하거나 모바일 및 데스크톱에 대한 레이아웃을 구분하여 Nux 앱의 모양과 느낌을 변경할 때 큰 도움이 됩니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/layouts)에서 확인하십시오.

### `pages`
이 디렉토리에는 응용프로그램 보기 및 경로가 포함되어 있습니다. Nuxt는 이 디렉토리에 있는 모든 '*.vue' 파일을 읽고 자동으로 Vue 라우터를 설정합니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/get-started/routing)에서 확인하십시오.

### `plugins`
plugins인 디렉토리에는 루트 Vue.js 응용 프로그램을 인스턴스화하기 전에 실행할 JavaScript 플러그인이 포함되어 있습니다. Vue 플러그인을 추가하고 함수 또는 상수를 주입하는 곳입니다. 'Vue.use()'를 사용해야 할 때마다 'plugins/'에 파일을 만들고 해당 경로를 'nux.config.js'에 있는 plugins에 추가해야 합니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/plugins)에서 확인하십시오.


### `static`
이 디렉토리에는 정적 파일이 포함되어 있습니다. 이 디렉터리에 있는 각 파일은 '/'에 매핑됩니다.

예: '/static/robots.txt'는 '/robots.txt'로 매핑됩니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/static)에서 확인하십시오.

### `static/api`
이 디렉토리에는 php로 작성된 RestAPI가 포함되어 있습니다. Nodejs Express style, Sequelize와 같은 코드를 php7로 쓸 수 있습니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://github.com/devxian96/phpExpress)에서 확인하십시오.

### `store`
이 디렉토리에는 Vuex 저장소 파일이 포함되어 있습니다. 이 디렉토리에 파일을 생성하면 Vuex가 자동으로 활성화됩니다.

이 디렉토리의 사용에 대한 자세한 내용은 [문서](https://nuxtjs.org/docs/2.x/directory-structure/store)에서 확인하십시오.

***

## 코드 스타일

### `commitlint`
```
feat        새로운 기능을 제공합니다.
fix         버그 수정.
doc         문서만 변경됩니다.
style       코드 작동에 영향을 미치지 않는 스타일 변경(빈 공간, 코드 포멧팅, 누락된 세미콜론 등)
refactor    버그를 수정하거나 기능을 추가하지 않는 코드 변경입니다.
test        테스트 코드를 추가하거나 기존 테스트 코드를 수정합니다.
chore       빌드 프로세스 또는 보조 도구 및 라이브러리(예: 문서 생성)에 대한 변경 사항.
perf        성능을 향상시키는 코드 변경입니다.
ci          CI 구성 파일 및 스크립트의 변경 사항.
build       빌드 시스템 또는 외부 디펜던시에 영향을 미치는 변경 사항(예: gulp, broccli, npm).
temp        변경사항에 포함되지 않는 임시 커밋입니다.
```