<template>
  <div>
    <v-subheader>접속 기록</v-subheader>

    <!-- 검색창 -->
    <v-text-field
      autofocus
      dense
      clearable
      flat
      messages="30 기록 검색됨"
      outlined
      placeholder="ID를 입력하십시오"
      prepend-inner-icon="fa-search"
      full-width
    />

    <!-- 게시판 시작 -->
    <v-simple-table>
      <template #default>
        <thead>
                    <!-- 테이블 헤더 추가 시작 -->
          <tr>
            <th class="text-name">ID</th>
            <th class="text-protocol">IP</th>
            <th class="text-referrer">접속 경로</th>
            <th class="text-browser">브라우저</th>
            <th class="text-os">운영체제</th>
            <th class="text-device">접속기기</th>
            <th class="text-result">결과</th>
            <th class="text-date">접속 날짜</th>
          </tr>
                    <!-- 테이블 헤더 추가 종료-->
        </thead>
        <tbody>
                <tr v-for="item in desserts" :key="item.name">
            <!-- 링크 연결 걸리적거려서 위 tr태그 안에서 끌어내려 주석 처리
              @click="
              $router.push(
                '/file/current-status-of-nonconformities-and-improvement-measures/1'
              )
            " -->          
            <td class="text-name">{{ item.name }}</td>
            <td class="text-protocol">{{ item.protocol }}</td>
            <td class="text-referrer">{{ item.referrer }}</td>
            <td class="text-browser">{{ item.browser }}</td>
            <td class="text-os">{{ item.os }}</td>
            <td class="text-device">{{ item.device }}</td>
            <td class="text-result">{{ item.result }}</td>
            <td class="text-date">{{ item.date }}</td>
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      page: 1,
      desserts: [
        // 작성양식
        // {
        //   name: ,
        //   protocol: ,
        //   referrer: ,
        //   browser: ,
        //   os: ,
        //   device: ,
        //   result: ,
        //   date: ,
        // }
        {
          name: 'Frozen Yogurt',
          protocol: 'localhost:3000',
          referrer: 'https://www.youtube.com/',
          browser: 'Chrome',
          os: 'windows',
          device: 'mobile',
          result: '로그인 성공',
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
