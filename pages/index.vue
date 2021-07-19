<template>
  <div>
    <!-- 슬라이드 쇼 시작 -->
    <v-carousel>
      <v-carousel-item
        v-for="(item, index) in slides"
        :key="index"
        :src="item.src"
      >
        <v-sheet color="transparent" height="100%">
          <v-row class="fill-height pl-10" align="end">
            <div class="text-h5 white--text">{{ item.summary }}</div>
          </v-row>
        </v-sheet>
      </v-carousel-item>
    </v-carousel>
    <!-- 슬라이드 쇼 종료 -->

    <!-- 여기다가 주석을 써보자 -->

    <v-divider class="mt-5 mb-5" />

    <v-row>
      <!-- 로그인 이력 시작 -->
      <v-col cols="4">
        <v-card>
          <v-img height="200px" src="https://picsum.photos/200/300">
            <v-app-bar flat color="transparent"></v-app-bar>

            <v-card-title class="white--text mt-8">
              <v-avatar color="success">
                <v-icon dark> fa-user </v-icon>
              </v-avatar>
              <p class="ml-3 mt-3">{{ name }}님 환영합니다</p>
            </v-card-title>
          </v-img>

          <v-card-text>
            <div class="font-weight-bold ml-8 mb-2">금일 로그인 이력</div>

            <v-timeline align-top dense>
              <v-timeline-item
                v-for="message in messages"
                :key="message.time"
                :color="message.color"
                small
              >
                <div>
                  <div class="font-weight-normal">
                    <strong>{{ message.from }}</strong> @{{ message.time }}
                  </div>
                  <div>{{ message.message }}</div>
                </div>
              </v-timeline-item>
            </v-timeline>
          </v-card-text>
        </v-card>
      </v-col>
      <!-- 로그인 이력 종료 -->

      <v-col>
        <!-- 최근 수정한 문서 시작 -->
        <v-card class="mb-5">
          <v-card-title>최근 수정한 문서</v-card-title>
          <v-card-text>
            <v-list>
              <v-list-item nuxt link dense>
                <v-list-item-title>문서이름</v-list-item-title>
                <v-list-item-subtitle>{{
                  new Date().toLocaleString()
                }}</v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
        <!-- 최근 수정한 문서 종료 -->

        <!-- 최근 확인한 문서 시작 -->
        <v-card>
          <v-card-title>최근 확인한 문서</v-card-title>
          <v-card-text>
            <v-list>
              <v-list-item nuxt link dense>
                <v-list-item-title>문서이름</v-list-item-title>
                <v-list-item-subtitle>{{
                  new Date().toLocaleString()
                }}</v-list-item-subtitle>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
        <!-- 최근 확인한 문서 종료 -->
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '관리자',
      slides: [
        {
          src: '/img/slide1.jpg',
          summary: '문서를 동시 수정하고 안전하게 보관할 수 있습니다.',
        },
        {
          src: '/img/slide2.jpg',
          summary:
            '효율적인 권한 관리로 문서에 대한 접근을 통제할 수 있습니다.',
        },
        {
          src: '/img/slide3.jpg',
          summary: '프로그래시브 프레임워크로 초고속 경험을 선사합니다.',
        },
      ],
      messages: [
        {
          from: '로그인',
          time: new Date().toLocaleString(),
          message: '로그인 성공',
        },
        {
          from: '로그인',
          time: new Date().toLocaleString(),
          message: '로그인 성공',
        },
        {
          from: '로그인',
          time: new Date().toLocaleString(),
          message: '로그인 성공',
        },
        {
          from: '로그인',
          time: new Date().toLocaleString(),
          message: '로그인 성공',
        },
        {
          from: '로그인',
          time: new Date().toLocaleString(),
          message: '로그인 실패 (192.168.0.1)',
        },
      ],
    }
  },
}
</script>
