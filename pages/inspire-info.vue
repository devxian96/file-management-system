<template>
  <div>
    <v-row>
      <!-- 회원 정보 수정 시작 -->
      <!-- 오른쪽 위 동그란 버튼 눌러야 수정 후 저장 가능 -->
      <v-col>
        <v-card class="overflow-hidden">
          <v-toolbar 
          flat
          color="success"
          dark
          >
            <v-icon>mdi-account</v-icon>
            <v-toolbar-title class="font-weight-medium">
              User Profile
            </v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn
              color="light-green darken-4"
              fab
              small
              @click="isEditing = !isEditing"
            >
              <v-icon v-if="isEditing">
                mdi-close
              </v-icon>
              <v-icon v-else>
                mdi-pencil
              </v-icon>
            </v-btn>
          </v-toolbar>
          <v-card-text>
            <v-row>
              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="ID" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="비밀번호" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="이름" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="전화번호" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="부서" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="직책" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field :disabled="!isEditing" label="IP" filled dense/>
              </v-col>

              <v-col cols="12" sm="6">
                <v-autocomplete
                  :disabled="!isEditing" 
                  :items="states"
                  :filter="customFilter"
                  item-text="name"
                  label="권한"
                  filled
                  dense
                ></v-autocomplete>
                </v-col>

              <v-col>
                <v-text-field :disabled="!isEditing" label="설명" filled dense/>
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
              Save
            </v-btn>
          </v-card-actions>
          <v-snackbar
            v-model="hasSaved"
            :timeout="2000"
            absolute
            bottom
            left
          >
            Your profile has been updated
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

    <!-- 접속 기록 시작 -->
    <v-card class="log">
      <v-card-title>
        접속 기록
      </v-card-title>
      <v-data-table
        dense
        :headers="headers"
        :items="messages"
        item-key="from"
        class="elevation-1"
      ></v-data-table>
    </v-card>
    <!-- 접속 기록 종료 -->
</div>
</template>

<script>
  export default {
    data () {
      return {
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
          { text: '접속 기록', value: 'time' },
          { text: 'IP', value: 'protocol' },
          { text: 'undefined', value: 'from' },
          { text: '결과', value: 'result' },
          { text: '수정한 문서', value: 'revise' },
          { text: '접속 경로', value: 'referrer' },
          { text: '브라우저', value: 'browser' },
          { text: '운영체제', value: 'os' },
          { text: '접속기기', value: 'device' },  
        ],
        messages: [
          {
          from: '로그인',
          time: new Date().toLocaleString(),
          protocol: 'localhost:3000',
          result: '로그인 성공',
          referrer: 'https://www.youtube.com/',
          browser: 'Chrome',
          os: 'windows',
          device: 'mobile',
          },
          {
            protocol: 'localhost:3000',
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
            revise: 'document/file',
            referrer: 'google.com',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 성공',
          },
          {
            from: '로그인',
            time: new Date().toLocaleString(),
            result: '로그인 실패 (192.168.0.1)',
          },
        ],
      }
    },

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