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
          <!-- 테이블 헤더 추가 시작 -->
          <!-- 기존에 ID를 name 태그로 정했기에
          실제 ID목록을 name태그로, 실명 목록을 realname태그로 지정 -->
          <tr>
            <!-- 체크박스 임시 제거
            <th>
              <v-checkbox
                v-model="checkbox"
                :label="`Checkbox 1: ${checkbox.toString()}`"
              ></v-checkbox>
            </th> -->
            <th class="text-name">ID</th>
            <th class="text-passWord">비밀번호</th>
            <th class="text-realName">이름</th>
            <th class="text-phoneNumber">전화번호</th>
            <th class="text-division">부서</th>        
            <th class="text-position">직책</th>        
            <th class="text-level">권한</th>        
            <th class="text-protocol">IP</th>        
            <th class="text-log">접속기록</th>
            <th class="text-modify">수정</th>
            <th class="text-delete">삭제</th>
          </tr>
          <!-- 테이블 헤더 추가 종료-->
        </thead>
        <tbody>
          <tr
            v-for="item in desserts"
            :key="item.name"
          >
            <!-- 링크 연결 걸리적거려서 위 tr태그 안에서 끌어내려 주석 처리
              @click="
              $router.push(
                '/file/current-status-of-nonconformities-and-improvement-measures/1'
              )
            " -->
          <!-- 표 데이터 추가 시작 -->
          <!-- 데이터 안의 스트링은 변수 지정 작업 필요 -->

            <!-- <td>
              <v-checkbox
                v-model="checkbox"
                :label="`Checkbox 1: ${checkbox.toString()}`"
              ></v-checkbox>
            </td> -->
            <td class="text-name">{{ item.name }}</td>
            <td class="text-passWord">{{ item.passWord }}</td>
            <td class="text-realName">{{ item.realName }}</td>
            <td class="text-phoneNumber">{{ item.phoneNumber }}</td>
            <td class="text-division">{{ item.division }}</td>
            <td class="text-position">{{ item.position }}</td>
            <td class="text-level">{{ item.level }}</td>
            <td class="text-protocol">{{ item.protocol }}</td>
            <td class="text-right">{{ item.date }}</td>
            <td class="text-modify">
              <v-btn
                elevation="2"
              >
              </v-btn>
            </td>
            <td class="text-delete">
              <v-btn
                elevation="2"
              >
              </v-btn>
            </td>
            <!-- 표 데이터 추가 종료-->
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
      checkbox: true,
      page: 1,
      desserts: [
        {
          name: 'Frozen Yogurt',
          date: new Date().toLocaleString(),
          passWord: '1111',
          realName: '김씨',
          phoneNumber:'010-0000-0000',
          division: '영업부',
          position: '사원',
          level: 'admin',
          protocol: 'localhost: 3000',    
        },
        {
          name: 'Ice cream sandwich',
          date: new Date().toLocaleString(),

          realName: '장씨',
        },
        {
          name: 'Eclair',
          date: new Date().toLocaleString(),
          passWord: 9999,
        },
        {
          name: 'Cupcake',
          date: new Date().toLocaleString(),
          position: '사장'
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
