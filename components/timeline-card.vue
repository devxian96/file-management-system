<template>
  <v-card class="mb-5">
    <!-- 작성자 정보 시작 -->
    <v-card-title>
      <v-avatar size="32" color="success" class="mr-2">
        <v-icon>fa-user</v-icon>
      </v-avatar>
      작성자
      <v-chip class="ma-2" color="red" small label text-color="white">
        <v-icon left> fa-info </v-icon>
        미결
      </v-chip>
      <v-chip class="ma-2" color="red" small label text-color="white">
        <v-icon left> fa-exclamation-triangle </v-icon>
        불량율 1/1(100%)
      </v-chip>
    </v-card-title>
    <!-- 작성자 정보 종료 -->

    <!-- 작성 시점 정보 시작 -->
    <v-card-subtitle>
      {{ new Date().toLocaleString() }}
    </v-card-subtitle>
    <!-- 작성 시점 정보 종료 -->

    <!-- 정보 시작 -->
    <v-card-text>
      <v-list dense>
        <v-list-item color="accent">
          <v-list-item-title> 검사일자 </v-list-item-title>
          <v-list-item-subtitle>
            {{ new Date().toLocaleString() }}
          </v-list-item-subtitle>
        </v-list-item>
        <v-list-item>
          <v-list-item-title> 고객사 </v-list-item-title>
          <v-list-item-subtitle> 유한정밀 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item color="accent">
          <v-list-item-title> 귀책부서 </v-list-item-title>
          <v-list-item-subtitle> 무진 </v-list-item-subtitle>
        </v-list-item>
        <v-list-item color="accent">
          <v-list-item-title> 작업자 </v-list-item-title>
          <v-list-item-subtitle> 익명 </v-list-item-subtitle>
        </v-list-item>
      </v-list>

      <v-alert color="red" border="left" elevation="2" colored-border dense>
        <h5>치수 불량</h5>
        <pre>
        1. 7g6부 NG
        -ACT : 6.79
        2. 370±0.02 치수 NG
        -ACT : 369.71</pre
        >
      </v-alert>

      <p>비고 아무글</p>
    </v-card-text>
    <!-- 정보 종료 -->

    <!-- 이미지란 시작 -->
    <v-row dense class="mb-3 pr-2 pl-2">
      <v-img src="/img/bg.png" max-width="400" />
    </v-row>
    <!-- 이미지란 종료 -->

    <v-divider inset class="m-auto" />

    <!-- 버튼 시작 -->
    <v-card-actions>
      <v-row dense>
        <v-col>
          <v-btn depressed color="transparent" width="100%"
            >발생원인 및 개선대책 현황 작성</v-btn
          >
        </v-col>
        <v-col>
          <v-btn depressed color="transparent" width="100%"
            >수정기록 확인</v-btn
          >
        </v-col>
      </v-row>
    </v-card-actions>
    <!-- 버튼 종료 -->
  </v-card>
</template>

<script>
export default {}
</script>

<style scoped>
.m-auto {
  margin: auto !important;
}
</style>
