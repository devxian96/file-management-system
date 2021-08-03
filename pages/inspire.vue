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
          <!-- 테이블 헤더 시작 -->
          <!-- 기존에 ID를 name 태그로 정했기에
          실제 ID목록을 name태그로, 실명 목록을 realname태그로 지정 -->
          <tr>
            <th class="text-name">ID</th>
            <th class="text-realName">이름</th>
            <th class="text-division">부서</th>
            <th class="text-position">직책</th>
            <th class="text-level">권한</th>
            <th class="text-modify">수정</th>
          </tr>
          <!-- 테이블 헤더 종료-->
        </thead>
        <tbody>
          <tr v-for="item in desserts" :key="item.name">
            <!-- 표 데이터 시작 -->
            <td class="text-name">{{ item.name }}</td>
            <td class="text-realName">{{ item.realName }}</td>
            <td class="text-division">{{ item.division }}</td>
            <td class="text-position">{{ item.position }}</td>
            <td class="text-level">{{ item.level }}</td>
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
              <v-btn color="error">
                삭제
              </v-btn>
            </td>
            <!-- 표 데이터 종료-->
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
          <v-col cols="12" sm="12">
            <v-text-field label="ID" filled dense class="mt-5" />
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field
            v-model="match"
            label="비밀번호"
            filled
            dense/>
          </v-col>
          <!-- 비밀번호 일치 유효성 검사 적용 -->
          <v-col cols="12" sm="6">
            <v-text-field
            v-model="match2"
            :rules="rules"
            label="비밀번호 확인"
            filled
            dense/>
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="이름" filled dense/>
          </v-col>

          <v-col cols="12" sm="6">
            <v-text-field label="부서" filled dense/>
          </v-col>

          <v-col cols="12" sm="6">  
            <v-text-field label="직책" filled dense/>
          </v-col>

          <v-col cols="12" sm="6">
            <v-autocomplete
              :items="states"
              :filter="customFilter"
              item-text="name" 
              label="권한"
              filled
              dense
            ></v-autocomplete>
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
        dialog: false,
        openWrite: false,
        page: 1,
        // 비밀번호 일치 유효성 시작
        match: '',
        match2: '',
        // 비밀번호 일치 유효성 종료
        desserts: [
          //   작성양식
          //   {
          //   name: ,
          //   realName: ,
          //   division: ,
          //   position: ,
          //   level: ,
          // },
          {
            name: 'Frozen Yogurt',
            realName: '김씨',
            division: '기획부',
            position: '부장',
            level: 'admin',
          },
          {
            name: 'Ice cream sandwich',
            realName: '장씨',
            division: '개발부',
            position: '사원',
            level: 'user',
          },
          {
            name: 'Eclair',          
          },
          {
            name: 'Cupcake',
            position: '사장',
          },
          {
            name: 'Gingerbread',
          },
          {
            name: 'Jelly bean',
          },
          {
            name: 'Lollipop',
          },
          {
            name: 'Honeycomb',
          },
          {
            name: 'Donut',
          },
          {
            name: 'KitKat',
          },
        ],
      }
    },
    // 비밀번호 일치 유효성 시작
    computed: {
      rules () {
        const rules = []

        if (this.match) {
          const rule =
            v => (!!v && v) === this.match ||
              '비밀번호가 일치하지 않습니다'

          rules.push(rule)
        }

        return rules
      },
    },
    // 비밀번호 일치 유효성 종료
  }
</script>
