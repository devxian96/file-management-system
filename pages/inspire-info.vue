<template>
  <div>
    <v-row>
      <v-icon
        size="32"
        color="primary"
        @click="
          $router.push(
            'inspire'
          )
        ">
        fas fa-arrow-left
      </v-icon>
      <v-subheader>회원 정보 및 접속 기록</v-subheader>
    </v-row>
    <v-row>
      <!-- 회원 정보 수정 시작 -->
      <v-col>
        <v-card class="overflow-hidden">
          <v-toolbar 
          flat
          color="success"
          dark
          >
            <v-toolbar-title class="font-weight-medium">
              회원 정보
            </v-toolbar-title>
            <v-spacer></v-spacer>
              <v-btn v-if="isEditing" @click="isEditing = !isEditing" color="light-green darken-4">
                취소
              </v-btn>
              <v-btn  v-else @click="isEditing = !isEditing" color="light-green darken-4">
                수정
              </v-btn>
          </v-toolbar>
          <v-card-text>
            <v-row>
              <v-col cols="12" sm="1">
                <v-subheader>ID</v-subheader>
              </v-col>
              <v-col cols="12" sm="11">
                <v-subheader>[ This is user id ]</v-subheader>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                v-model="match"
                :disabled="!isEditing"
                label="비밀번호"
                filled
                dense/>
              </v-col>
              <!-- 비밀번호 일치 유효성 검사 적용 -->
              <v-col cols="12" sm="6">
                <v-text-field
                v-model="match2"
                :rules="rules"
                :disabled="!isEditing"
                label="비밀번호 확인"
                filled
                dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="이름" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="부서" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="직책" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-autocomplete
                  :items="states"
                  :filter="customFilter"
                  item-text="name"
                  :disabled="!isEditing" 
                  label="권한"
                  filled
                  dense
                ></v-autocomplete>
              </v-col>

              <v-col cols="12" sm="3">
                <v-subheader>계정 생성일</v-subheader>
              </v-col>
              <v-col cols="12" sm="3">
                <v-subheader>xxxx. x. x</v-subheader>
              </v-col>

              <v-col cols="12" sm="3">
                <v-subheader>계정 수정일</v-subheader>
              </v-col>
              <v-col cols="12" sm="3">
                <v-subheader>xxxx. x. x</v-subheader>
              </v-col>
            </v-row>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              :disabled="!isEditing"
              color="success"
              @click="save"
            >
              저장
            </v-btn>
          </v-card-actions>
          <v-snackbar
            v-model="hasSaved"
            :timeout="3000"
            absolute
            bottom
            left
          >
            수정 사항이 저장되었습니다
          </v-snackbar>
        </v-card>
      </v-col>
      <!-- 회원 정보 수정 종료 -->

      <!-- 최근 수정한 문서 시작 -->
      <v-col class="document" cols="4">
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
    <!-- 회원 정보 수정 종료 -->

    <!-- 활동 로그 시작 -->
    <v-card class="log">
      <v-card-title>
        활동 로그
      </v-card-title>
      <v-data-table
        dense
        :headers="headers"
        :items="messages"
              :page.sync="page"

        item-key="from"
      :items-per-page="itemsPerPage"
      hide-default-footer
      class="elevation-1"
      @page-count="pageCount = $event"
      ></v-data-table>
      <div class="text-center pt-2">
      <v-pagination
        v-model="page"
        :length="pageCount"
      ></v-pagination>
    </div>
    </v-card>
    <!-- 활동 로그 종료 -->
</div>
</template>

<script>
  export default {
    data () {
      return {
        page: 1,
        pageCount: 0,
                itemsPerPage: 10,

        // 비밀번호 일치 유효성 시작
        match: '',
        match2: '',
        // 비밀번호 일치 유효성 종료
        hasSaved: false,
        isEditing: false,
        model: null,
        states: [
          { name: '1', abbr: 'FL', id: 1 },
          { name: '2', abbr: 'GA', id: 2 },
          { name: '3', abbr: 'NE', id: 3 },
          { name: '4', abbr: 'CA', id: 4 },
        ],
        headers: [
          {
            align: 'start',
            sortable: false,
          },
          { text: '로그 생성일', value: 'time' },
          { text: 'IP', value: 'protocol' },
          { text: '활동', value: 'from' },
          { text: '결과', value: 'result' },
          { text: '접근 경로', value: 'referrer' },
          { text: '수정 메시지', value: 'reviseMassage' }, 
        ],
        messages: [
          // 작성 양식
          // {
          // time: new Date().toLocaleString(),
          // from: '',
          // protocol: '',
          // result: '',
          // referrer: '',
          // reviseMassage: '',
          // },
          {
          time: new Date().toLocaleString(),
          from: '로그인',
          protocol: 'localhost:3000',
          result: '로그인 성공',
          referrer: 'https://www.youtube.com/',
          reviseMassage: '파일 삭제',
          },
          {
            time: new Date().toLocaleString(),
            protocol: 'localhost:3000',
            from: '로그인',
            result: '로그인 성공',
            referrer: 'google.com',
            reviseMassage: '사진 추가',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 실패 (192.168.0.1)',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 성공',
          },
          {
            time: new Date().toLocaleString(),
            from: '로그인',
            result: '로그인 실패 (192.168.0.1)',
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

    methods: {
      customFilter (item, queryText, itemText) {
        const textOne = item.name.toLowerCase()
        const textTwo = item.abbr.toLowerCase()
        const searchText = queryText.toLowerCase()

        return textOne.includes(searchText) > -1 ||
          textTwo.includes(searchText) > -1
      },
      save () {
        this.isEditing = !this.isEditing
        this.hasSaved = true
      },
    },
  }
</script>

<style>
  .document {
    display: flex;
    flex-direction: column;
  }
  .document * {
    flex-grow: 1;
  }
  .log {
    margin-top: 20px;
  }
</style>