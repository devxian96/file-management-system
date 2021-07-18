<template>
  <v-app dark>
    <v-navigation-drawer v-model="drawer" clipped fixed app>
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar clipped-left fixed app dense>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title v-text="title" />
      <v-spacer />
      <v-btn depressed to="/login">
        <v-icon class="pr-2">fa-sign-out-alt</v-icon>로그아웃
      </v-btn>
    </v-app-bar>
    <v-main>
      <v-container fluid>
        <Nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      drawer: false,
      items: [
        {
          title: '홈',
          to: '/',
        },
        {
          title: '출하검사 이력 카드',
          to: '/file/shipment-inspection-history-card',
        },
        {
          title: '부적합 발생 및 개선대책 현황',
          to: '/file/current-status-of-nonconformities-and-improvement-measures',
        },
        {
          title: '관리자 설정',
          to: '/inspire',
        },
      ],
      title: '문서관리 시스템',
    }
  },
}
</script>
