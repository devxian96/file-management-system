<template>
  <div>
    <v-subheader>관리자 설정</v-subheader>
    <!-- 검색창 -->
    <v-text-field
      autofocus
      dense
      clearable
      flat
      messages="10 회원 검색됨"
      outlined
      placeholder="회원 입력"
      prepend-inner-icon="fa-search"
      full-width
    />

    <!-- 게시판 시작 -->
    <v-simple-table>
      <template #default>
        <thead>
          <tr>
            <th class="text-id">ID</th>
            <th class="text-name">이름</th>
            <th class="text-passWord">비밀번호</th>
            <th class="text-phoneNumber">전화번호</th>
            <th class="text-position">직책</th>        
            <th class="text-division">부서</th>        
            <th class="text-level">권한</th>        
            <th class="text-protocol">IP</th>        
            <th class="text-log">접속기록</th>
            <th class="text-admin">관리</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="item in desserts"
            :key="item.name"
            @click="
              $router.push(
                '/file/current-status-of-nonconformities-and-improvement-measures/1'
              )
            "
          >
            <td>{{ item.name }}</td>
            <td class="text-right">{{ item.date }}</td>
            <td class="text-right">{{ item.date }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    <!-- 게시판 종료 -->

    <!-- 페이지 네이션 시작 -->
    <div class="text-center">
      <v-pagination v-model="page" :length="6"></v-pagination>
    </div>
    <!-- 페이지 네이션 종료 -->

    <!-- 회원 추가 시작 -->
    <v-row dense>
      <v-btn absolute right color="success">회원 추가</v-btn>
    </v-row>
    <!-- 회원 추가 종료 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      page: 1,
      desserts: [
        {
          name: 'Frozen Yogurt',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Ice cream sandwich',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Eclair',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Cupcake',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Gingerbread',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Jelly bean',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Lollipop',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Honeycomb',
          date: new Date().toLocaleString(),
        },
        {
          name: 'Donut',
          date: new Date().toLocaleString(),
        },
        {
          name: 'KitKat',
          date: new Date().toLocaleString(),
        },
      ],
    }
  },
}
</script>
