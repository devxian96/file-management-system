<template>
  <v-card
    elevation="4"
    class="m-auto"
    min-width="400px"
    width="100%"
    max-width="1200px"
  >
    <v-row no-gutters dense>
      <!-- 로그인 이미지 -->
      <v-col cols="6">
        <v-img
          src="/img/bg.png"
          lazy-src="/img/bg.png"
          height="100%"
          width="100%"
        />
      </v-col>

      <!-- 로그인 폼 -->
      <v-col cols="6" class="text-center pt-5 pr-5 pl-5">
        <v-avatar color="success">
          <v-icon dark> fa-lock </v-icon>
        </v-avatar>
        <h2>문서관리 시스템 로그인</h2>
        <v-text-field label="아이디" required full-width />
        <v-text-field type="password" label="비밀번호" required />
        <small>비밀번호 분실시 관리자에게 문의해 주시기 바랍니다.</small>

        <v-btn color="success" width="100%" large class="mt-10" to="/"
          >로그인</v-btn
        >
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  layout: 'login',
}
</script>

<style scoped>
.m-auto {
  margin: auto;
}
</style>
