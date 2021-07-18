<template>
  <div>
    <v-subheader>부적합 발생 및 개선대책 현황</v-subheader>

    <!-- 검색창 -->
    <v-text-field
      autofocus
      dense
      clearable
      flat
      messages="2,000 문서 검색됨"
      outlined
      placeholder="검색어를 입력하십시오"
      prepend-inner-icon="fa-search"
      full-width
    />

    <!-- 게시판 시작 -->
    <v-simple-table>
      <template #default>
        <thead>
          <tr>
            <th class="text-left">제목</th>
            <th class="text-right">생성일</th>
            <th class="text-right">마지막 수정일</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in desserts" :key="item.name">
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

    <!-- 문서추가 시작 -->
    <v-row dense>
      <v-btn absolute right color="success">문서추가</v-btn>
    </v-row>
    <!-- 문서추가 종료 -->
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
          date: 159,
        },
        {
          name: 'Ice cream sandwich',
          date: 237,
        },
        {
          name: 'Eclair',
          date: 262,
        },
        {
          name: 'Cupcake',
          date: 305,
        },
        {
          name: 'Gingerbread',
          date: 356,
        },
        {
          name: 'Jelly bean',
          date: 375,
        },
        {
          name: 'Lollipop',
          date: 392,
        },
        {
          name: 'Honeycomb',
          date: 408,
        },
        {
          name: 'Donut',
          date: 452,
        },
        {
          name: 'KitKat',
          date: 518,
        },
      ],
    }
  },
}
</script>
