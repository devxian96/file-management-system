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
            <th class="text-realName">이름</th>
            <th class="text-division">부서</th>
            <th class="text-position">직책</th>
            <th class="text-level">권한</th>
            <th class="text-protocol">IP</th>
            <th class="text-log">접속기록</th>
            <th class="text-modify">수정</th>
            <!-- <th class="text-delete">삭제</th> -->
          </tr>
          <!-- 테이블 헤더 추가 종료-->
        </thead>
        <tbody>
          <tr v-for="item in desserts" :key="item.name">

            <!-- 표 데이터 추가 시작 -->
            <!-- <td>
              <v-checkbox
                v-model="checkbox"
                :label="`Checkbox 1: ${checkbox.toString()}`"
              ></v-checkbox>
            </td> -->
            <td class="text-name">{{ item.name }}</td>
            <td class="text-realName">{{ item.realName }}</td>
            <td class="text-division">{{ item.division }}</td>
            <td class="text-position">{{ item.position }}</td>
            <td class="text-level">{{ item.level }}</td>
            <td class="text-protocol">{{ item.protocol }}</td>
            <td class="text-right">{{ item.date }}</td>
            <td class="text-modify">
              <v-btn 
                color="primary"
                @click="
                  $router.push(
                    'inspire-info'
                  )
                "
              >
              수정
              </v-btn>
              <!-- </td> -->
              <!-- <td class="text-delete"> -->
              <v-btn color="error"> 제거 </v-btn>
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
    <v-dialog v-model="openWrite" width="600px">
      <template #activator="{ on, attrs }">
        <v-btn
          absolute right color="success"
          dense
          filled
          v-bind="attrs"
          v-on="on"
          >회원 추가<v-spacer
        /></v-btn>
      </template>
      <v-card>
        <v-toolbar
          color="success"
          class="text-h5 font-weight-bold"
          dark
          dense
          ><v-spacer />회원 상세 정보<v-spacer /><v-btn
            icon
            dark
            @click="openWrite = false"
          >
            <v-icon>fa-times-circle</v-icon>
          </v-btn></v-toolbar
        >
        <v-card-text class="mt-5">
        <v-row>
          <v-col cols="12" sm="6">
            <v-text-field label="ID" filled class="mt-5" />
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="비밀번호" filled />
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="이름" filled />
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="전화번호" filled />
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="부서" filled />
          </v-col>

          <v-col cols="12" sm="6">  
            <v-text-field label="직책" filled />
          </v-col>
          
          <v-col cols="12" sm="6">
            <v-text-field label="IP" filled />
          </v-col>

          <v-col cols="12" sm="6">
            <v-overflow-btn
              class="mb-6 mt-0"
              :items="['1', '2', '3', '4']"
              label="권한"
              filled
            ></v-overflow-btn>
          </v-col>
          
          <v-col cols="8" sm="12">
            <v-text-field label="설명" filled />
          </v-col>
        </v-row>
        </v-card-text>
        <v-card-actions>
          <v-btn
            color="success"
            dark
            width="100%"
            class="font-weight-bold"
            @click="openWrite = false"
          >
            등록
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- 회원 추가 종료 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 추가한 스크립트
      checkbox: true,
      // 추가한 스크립트
      openWrite: false,
      page: 1,
      desserts: [
        //   작성양식
        //   {
        //   name: ,
        //   date: new Date().toLocaleString(),
        //   realName: ,
        //   phoneNumber: ,
        //   division: ,
        //   position: ,
        //   level: ,
        //   protocol: ,
        // },
        {
          name: 'Frozen Yogurt',
          date: new Date().toLocaleString(),
          realName: '김씨',
          division: '기획부',
          position: '부장',
          level: 'admin',
          protocol: 'localhost: 3000',
        },
        {
          name: 'Ice cream sandwich',
          date: new Date().toLocaleString(),
          realName: '장씨',
          division: '개발부',
          position: '사원',
          level: 'user',
          protocol: 'localhost: 8000',

        },
        {
          name: 'Eclair',
          date: new Date().toLocaleString(),          
        },
        {
          name: 'Cupcake',
          date: new Date().toLocaleString(),
          position: '사장',
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
